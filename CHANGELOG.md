# audit_artifactory CHANGELOG

This file is used to list changes made in each version of the audit_artifactory cookbook.

# 0.1.0

Initial release.

# 0.4.0

* Rename to audit_artifactory and updated attributes to reflect
* Added support for API key authentication
* Switched to Chef::HTTP for better SSL management
* added tests for versioned and latest
* moved URL to ['audit_artifactory']['base_url'] out of the individual profiles

# Backlog
* Right now compliance profiles are expected to end with `.tgz`, we'll add support for `.tar.gz` and .`zip` soon.
* inspec_cron support -> by way of path sources? converting attributes into the right namespace?
* user/password support if there's a reason not to use API keys?
curl -umattray:httplocalhost8081artifactory -O "http://localhost:8081/artifactory/test-repo/testgroup/uptime-profile/uptime-profile-0.1.0.tgz"
curl -umattray:httplocalhost8081artifactory "http://localhost:8081/artifactory/api/search/latestVersion?g=testgroup&a=uptime-profile&repos=test-repo"
## User/Password

If authentication is required you may use your user and password to access artifacts. Set the following attributes accordingly:

    node['audit_artifactory']['user'] = 'USER'
    node['audit_artifactory']['password'] = 'PASSWORD'
