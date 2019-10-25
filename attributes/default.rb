default['audit-artifactory']['profiles'] = {}
default['audit-artifactory']['user'] = nil
default['audit-artifactory']['password'] = nil
default['audit-artifactory']['api_key'] = nil

default['audit-artifactory']['cache_dir'] = "#{Chef::Config['file_cache_path']}/audit-artifactory"
default['audit']['profiles'] = {} # required for writing profiles to the audit cookbook
