#
# Cookbook:: audit-artifactory
# Recipe:: default
#

# iterate over hash of attributes
node['audit-artifactory']['profiles'].keys.each do |name|
  profile = node['audit-artifactory']['profiles'][name]

  version = profile['version'] ? profile['version'] : 'latest'

  artifactory_profile name do
    base_url profile['base_url']
    group profile['group']
    repo profile['repo']
    artifact profile['artifact']
    version version
  end
end

include_recipe 'audit::default'
