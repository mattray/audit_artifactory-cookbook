#
# Cookbook:: audit-artifactory
# Recipe:: default
#

# iterate over hash of attributes
node['audit-artifactory']['profiles'].keys.each do |name|
  profile = node['audit-artifactory']['profiles'][name]
  if profile['version'].nil?
    version = 'latest'
  else
    version = profile['version']
  end

  artifactory_profile name do
    base_url profile['base_url']
    group profile['group']
    repo profile['repo']
    version version
  end
end

include_recipe 'audit::default'
