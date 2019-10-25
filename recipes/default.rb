#
# Cookbook:: audit_artifactory
# Recipe:: default
#

# iterate over hash of attributes
node['audit_artifactory']['profiles'].keys.each do |name|
  profile = node['audit_artifactory']['profiles'][name]

  artifactory_profile name do
    base_url node['audit_artifactory']['base_url']
    group profile['group']
    repo profile['repo']
    version profile['version']
    api_key node['audit_artifactory']['api_key']
  end
end

include_recipe 'audit::default'
