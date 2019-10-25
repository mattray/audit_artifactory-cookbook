# audit_artifactory CHANGELOG

This file is used to list changes made in each version of the audit_artifactory cookbook.

# 0.1.0

Initial release.

# 0.2.0

* Rename to audit_artifactory. Attributes are unchanged.


TODO:
Right now compliance profiles are expected to end with `.tgz`, we'll add support for `.tar.gz` and .`zip` soon.

Handle non-Artifactory profiles same as audit cookbook. Pass-through to node['audit']['profiles']

Check for changes.

Download directly given version

if using 'latest' need to have repo organized properly

support for
- unprivileged
- API credentials
- user/password

- inspec_cron support -> by way of path sources? converting attributes into the right namespace?
