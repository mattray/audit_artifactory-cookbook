# audit_artifactory

This wraps the [Audit](https://github.com/chef-cookbooks/audit) cookbook and interacts with Artifactory's REST API. The name of your artifact is the key for the hash of attributes.

    node['audit-artifactory']['profiles']['test-inspec']['base_url'] = 'http://ec2-13-211-219-25.ap-southeast-2.compute.amazonaws.com:8081/artifactory'
    node['audit-artifactory']['profiles']['test-inspec']['group'] = 'testgroup'
    node['audit-artifactory']['profiles']['test-inspec']['repo'] = 'inspecpoc'
    node['audit-artifactory']['profiles']['test-inspec']['version'] = '1.0.1'

# Artifactory Open Source vs. Artifactory Pro

API access is restricted to Artifactory Pro, but you may use the custom resources provided by this cookbook to directly access the artifacts. Artifactory Pro will allow you to access the `latest` version, Artifactory Open Source will require that you know the version you want to install.

# Authentication

Depending on how your Artifactory instance is configured, you may interact with your repositories 3 different ways:

## No Authentication

Anonymous access is allowed, this is set in Artifactor through the Admin tab -> Security Configuration and "Allow Anonymous Access".

## Password

If authentication is required you may use your user and password to access artifacts. Set the following attributes accordingly:

    node['audit-artifactory']['user'] = 'USER'
    node['audit-artifactory']['password'] = 'PASSWORD'

## API Key

The preferred method for authenticating with the API is to use an API Key. This is configured under User Profile -> Authentication Settings. Copy this value and set it with the following attribute:

    node['audit-artifactory']['api_key'] = 'AKCp5e2gMx8TtJNDtrsuPq7Jz24Rqjkjf1d1iiy1GuEjmdsY8ghxFGgehZcK3UGNgy5TxHWdE'

# Configuring Repositories

When setting up the Artifactory repository to hold your compliance profiles, you will need to use the following settings when creating your repository if you want to be able to use the APIs. When creating a new `Local Repository`, choose `Generic`, and set your `Repository Key` accordingly. When you go to the `Artifacts` tab to `Deploy` artifacts, you will need to set the `Target Path` to

```group/artifact_name/artifact_name-0.1.0.tgz```

* The `artifact_name` will be used as the key for `node['audit-artifactory']['profiles']['ARTIFACT_NAME']`
* `Repository Key` will be used as your `node['audit-artifactory']['profiles']['ARTIFACT_NAME']['repo']`
* `group` will be used in the API calls in your `node['audit-artifactory']['profiles']['ARTIFACT_NAME']['group']`

# Testing

docker run --name artifactory -d -p 8081:8081 docker.bintray.io/jfrog/artifactory-pro:latest
change the default password from 'password'

API key: AKCp5e2gMx8TtJNDtrsuPq7Jz24Rqjkjf1d1iiy1GuEjmdsY8ghxFGgehZcK3UGNgy5TxHWdE
password: 'httplocalhost8081artifactory'

curl -O "http://localhost:8081/artifactory/test-repo/testgroup/uptime-profile/uptime-profile-0.1.0.tgz"
curl "http://localhost:8081/artifactory/api/search/latestVersion?g=testgroup&a=uptime-profile&repos=test-repo"

curl -umattray:httplocalhost8081artifactory -O "http://localhost:8081/artifactory/test-repo/testgroup/uptime-profile/uptime-profile-0.1.0.tgz"
curl -umattray:httplocalhost8081artifactory "http://localhost:8081/artifactory/api/search/latestVersion?g=testgroup&a=uptime-profile&repos=test-repo"

curl -H 'X-JFrog-Art-Api:AKCp5e2gMx8TtJNDtrsuPq7Jz24Rqjkjf1d1iiy1GuEjmdsY8ghxFGgehZcK3UGNgy5TxHWdE' -O "http://localhost:8081/artifactory/test-repo/testgroup/uptime-profile/uptime-profile-0.1.0.tgz"
curl -H 'X-JFrog-Art-Api:AKCp5e2gMx8TtJNDtrsuPq7Jz24Rqjkjf1d1iiy1GuEjmdsY8ghxFGgehZcK3UGNgy5TxHWdE' "http://localhost:8081/artifactory/api/search/latestVersion?g=testgroup&a=uptime-profile&repos=test-repo"
