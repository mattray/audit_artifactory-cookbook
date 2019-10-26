resource_name :artifactory_profile

property :artifact, String, name_property: true
property :base_url, String, required: true
property :repo, String, required: true
property :group, String, required: true
property :version, String, default: 'latest'
property :api_key, String

action :install do
  artifact = new_resource.artifact
  base_url = new_resource.base_url.chomp('/') # strip trailing /
  repo = new_resource.repo
  group = new_resource.group
  version = new_resource.version
  api_key = new_resource.api_key

  cache_dir = node['audit_artifactory']['cache_dir']
  directory cache_dir

  # get the version of the latest
  if version.eql?('latest')
    version = Chef::HTTP.new(base_url).get("/api/search/latestVersion?g=#{group}&a=#{artifact}&repos=#{repo}", headers = { "X-JFrog-Art-Api" => api_key })
  end

  remote_url = "#{base_url}/#{repo}/#{group}/#{artifact}/#{artifact}-#{version}.tgz"
  # fileurl = "#{base_url}/#{repo}/#{group}/#{artifact}/#{artifact}-#{version}.tar.gz"
  # fileurl = "#{base_url}/#{repo}/#{group}/#{artifact}/#{artifact}-#{version}.zip"

  local_path = "#{cache_dir}/#{artifact}-#{version}.tgz"

  # download the artifact
  remote_file local_path do
    source remote_url
    headers({ "X-JFrog-Art-Api" => api_key })
    # headers( "Authorization"=>"Basic #{ Base64.encode64("#{username}:#{password}").gsub("\n", "") }" )
    mode '0600'
    action :create
  end

  # add the local file to the audit cookbook
  node.default['audit']['profiles'][artifact]['path'] = local_path
end
