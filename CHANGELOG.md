# audit_artifactory CHANGELOG

This file is used to list changes made in each version of the audit_artifactory cookbook.

# 0.1.0

Initial release.

# 0.2.0

* Rename to audit_artifactory and updated attributes to reflect
* Switched to Chef::HTTP for better SSL management
* added tests for versioned and latest
* moved URL to ['audit_artifactory']['base_url'] out of the individual profiles

test for
- unprivileged
- API credentials
- user/password

Right now compliance profiles are expected to end with `.tgz`, we'll add support for `.tar.gz` and .`zip` soon.

- inspec_cron support -> by way of path sources? converting attributes into the right namespace?
