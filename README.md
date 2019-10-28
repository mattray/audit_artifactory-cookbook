# audit_artifactory

This wraps the [Audit](https://github.com/chef-cookbooks/audit) cookbook and interacts with Artifactory's REST API. You will need to provide the base URL for the Artifactory instance and the name of your compliance profile artifact is the key for the hash of attributes.

    node['audit_artifactory']['base_url'] = 'http://artifactory.example.com:8081/artifactory'
    node['audit_artifactory']['profiles']['test-inspec']['group'] = 'testgroup'
    node['audit_artifactory']['profiles']['test-inspec']['repo'] = 'inspecpoc'
    node['audit_artifactory']['profiles']['test-inspec']['version'] = '1.0.1'

If you do not provide a version, it will attempt to download the latest version available (requires Artifactory Pro). The compliance profile is downloaded and added to the node's attributes under

    node['audit']['profiles']['test-inspec']

with the local path to the artifact.

# Artifactory Open Source vs. Artifactory Pro

API access is restricted to Artifactory Pro, but you may use the custom resources provided by this cookbook to directly access the artifacts. Artifactory Pro will allow you to access the `latest` version, Artifactory Open Source will require that you know the version you want to install.

# Authentication

Depending on how your Artifactory instance is configured, you may interact with your repositories 3 different ways:

## No Authentication

Anonymous access is supported. This is set in Artifactory through the tab `Admin` -> `Security Configuration` -> `Allow Anonymous Access`.

## API Key

The preferred method for authenticating with the API is to use an API Key. This is configured under `User Profile` -> `Authentication Settings`. Copy this value and set it with the following attribute:

    node['audit_artifactory']['api_key'] = 'AKCp5e2gMx8TtJNDtrsuPq7Jz24Rqjkjf1d1iiy1GuEjmdsY8ghxFGgehZcK3UGNgy5TxHWdE'

# Configuring Repositories

When setting up the Artifactory repository to hold your compliance profiles, you will need to use the following settings when creating your repository if you want to be able to use the APIs. When creating a new `Local Repository`, choose `Generic`, and set your `Repository Key` accordingly. When you go to the `Artifacts` tab to `Deploy` artifacts, you will need to set the `Target Path` to

```group/artifact_name/artifact_name-0.1.0.tgz```

* The `artifact_name` will be used as the key for `node['audit_artifactory']['profiles']['ARTIFACT_NAME']`
* `Repository Key` will be used as your `node['audit_artifactory']['profiles']['ARTIFACT_NAME']['repo']`
* `group` will be used in the API calls in your `node['audit_artifactory']['profiles']['ARTIFACT_NAME']['group']`

# Testing

These were the shell commands used to download and test API interactions with Artifactory Pro after getting a trial license for testing:

    docker run --name artifactory -d -p 8081:8081 docker.bintray.io/jfrog/artifactory-pro:latest

API key: AKCp5e2gMx8TtJNDtrsuPq7Jz24Rqjkjf1d1iiy1GuEjmdsY8ghxFGgehZcK3UGNgy5TxHWdE
password: 'httplocalhost8081artifactory'

    curl -O "http://localhost:8081/artifactory/test-repo/testgroup/uptime-profile/uptime-profile-0.1.0.tgz"
    curl "http://localhost:8081/artifactory/api/search/latestVersion?g=testgroup&a=uptime-profile&repos=test-repo"

    curl -H 'X-JFrog-Art-Api:AKCp5e2gMx8TtJNDtrsuPq7Jz24Rqjkjf1d1iiy1GuEjmdsY8ghxFGgehZcK3UGNgy5TxHWdE' -O "http://localhost:8081/artifactory/test-repo/testgroup/uptime-profile/uptime-profile-0.1.0.tgz"
    curl -H 'X-JFrog-Art-Api:AKCp5e2gMx8TtJNDtrsuPq7Jz24Rqjkjf1d1iiy1GuEjmdsY8ghxFGgehZcK3UGNgy5TxHWdE' "http://localhost:8081/artifactory/api/search/latestVersion?g=testgroup&a=uptime-profile&repos=test-repo"

# License and Authors

- Author: Matt Ray [matt@chef.io](mailto:matt@chef.io)
- Author: Egor Cole [egor.cole@fastlane-it.com](egor.cole@fastlane-it.com)
- Copyright 2018-2019, Chef Software, Inc

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
