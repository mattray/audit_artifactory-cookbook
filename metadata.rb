name 'audit-artifactory' # ~FC078
maintainer 'Matt Ray'
maintainer_email 'matt@chef.io'
license 'All Rights Reserved'
description 'Installs/Configures audit-artifactory'
long_description 'Installs/Configures audit-artifactory'
version '0.1.0'
chef_version '>= 14.0' if respond_to?(:chef_version)

depends 'audit', '~> 7.6.0'

issues_url       'https://github.com/chef-cookbooks/testsomething/issues'
source_url       'https://github.com/chef-cookbooks/testsomething'

supports         'redhat'
