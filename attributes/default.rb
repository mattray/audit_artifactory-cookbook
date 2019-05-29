default['audit']['reporter'] = 'chef-automate'
default['audit']['insecure'] = true
default['audit']['server'] = 'https://ec2-13-210-69-188.ap-southeast-2.compute.amazonaws.com/data-collector/v0/'
default['audit']['token'] = 'God3ytMQm6w4QbbdrFJGyEvEFZY='
default['audit']['profiles'] = {}

default['audit-artifactory']['profiles'] = {
  'test' => {
    'version' => 'latest',
    'base_url' => 'http://ec2-13-211-219-25.ap-southeast-2.compute.amazonaws.com:8081/artifactory',
    'group' => 'uob',
    'artifact' => 'test-inspec',
    'repo' => 'inspecpoc',
  },
}

# default['audit']['fetcher'] = 'chef-automate'
# default['audit']['reporter'] = 'json-file'
# default['audit']['server'] = 'https://ec2-13-239-133-233.ap-southeast-2.compute.amazonaws.com/data-collector/v0/'
# default['audit']['refresh_token'] = 'God3ytMQm6w4QbbdrFJGyEvEFZY='
