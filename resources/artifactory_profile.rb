resource_name :artifactory_profile

property :artifact, String, name_property: true
property :base_url, String, required: true
property :group, String, required: true
property :repo, String, required: true
property :version, String, default: 'latest'

action :install do
  base_url = new_resource.base_url.chomp('/') # strip trailing /
  repo = new_resource.repo
  group = new_resource.group
  artifact = new_resource.artifact
  version = new_resource.version

  cache_dir = node['audit-artifactory']['cache_dir']
  directory cache_dir

  # get the version of the latest
  if version.eql?('latest')
    version = Chef::HTTP.new(base_url).get("/api/search/latestVersion?g=#{group}&a=#{artifact}&repos=#{repo}")
  end

  remote_url = "#{base_url}/#{repo}/#{group}/#{artifact}/#{artifact}-#{version}.tgz"
  # fileurl = "#{base_url}/#{repo}/#{group}/#{artifact}/#{artifact}-#{version}.tar.gz"
  # fileurl = "#{base_url}/#{repo}/#{group}/#{artifact}/#{artifact}-#{version}.zip"

  local_path = "#{cache_dir}/#{artifact}-#{version}.tgz"

  # download the artifact
  remote_file local_path do
    source remote_url
    mode '0600'
    action :create
  end

  # add the local file to the audit cookbook
  node.default['audit']['profiles'][artifact]['path'] = local_path
end
