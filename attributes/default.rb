default['audit_artifactory']['profiles'] = {}
default['audit_artifactory']['user'] = nil
default['audit_artifactory']['password'] = nil
default['audit_artifactory']['api_key'] = nil

default['audit_artifactory']['cache_dir'] = "#{Chef::Config['file_cache_path']}/audit_artifactory"
default['audit']['profiles'] = {} # required for writing profiles to the audit cookbook
