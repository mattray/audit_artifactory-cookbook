# InSpec test for recipe audit_artifactory::default

profile = attribute('profile')
json_file = attribute('json_file')

describe file(profile) do
  it { should exist }
  its('size') { should > 4600 }
  its('size') { should < 4800 }
end

describe file(json_file) do
  it { should exist }
end

describe json(json_file) do
  its(["profiles", 0, "name"]) { should eq "uptime" }
  its(["profiles", 0, "controls", 0, "results", 0, "status"]) { should eq "passed" }
  its(["profiles", 0, "controls", 1, "results", 0, "status"]) { should eq "failed" }
end
