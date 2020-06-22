name 'audit_artifactory'
maintainer 'Matt Ray'
maintainer_email 'matt@chef.io'
license 'Apache-2.0'
description 'Downloads profiles from Artifactory to use with the Audit cookbook'
version '0.4.1'
chef_version '>= 14.0'

depends 'audit', '~> 7.6.0'

issues_url       'https://github.com/mattray/audit_artifactory-cookbook/issues'
source_url       'https://github.com/mattray/audit_artifactory-cookbook'

supports         'redhat'
supports         'centos'
