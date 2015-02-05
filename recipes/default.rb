#
# Cookbook Name:: sonar
# Recipe:: default
#
# Copyright 2011, Christian Trabold
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "java"

package "unzip"

remote_file "/opt/sonarqube-#{node['sonar']['version']}.zip" do
  source "#{node['sonar']['mirror']}/sonarqube-#{node['sonar']['version']}.zip"
  mode "0644"
  checksum "#{node['sonar']['checksum']}"
  not_if { ::File.exists?("/opt/sonarqube-#{node['sonar']['version']}.zip") }
end

execute "unzip /opt/sonarqube-#{node['sonar']['version']}.zip -d /opt/" do
  not_if { ::File.directory?("/opt/sonarqube-#{node['sonar']['version']}/") }
end

link "/opt/sonar" do
  to "/opt/sonarqube-#{node['sonar']['version']}"
end

service "sonar"

template "sonar_init_script" do
  path "/etc/init.d/sonar"
  source "init_script.erb"
  owner "root"
  group "root"
  mode "0755"
  notifies :restart, resources(:service => "sonar")
end

template "sonar.properties" do
  path "/opt/sonar/conf/sonar.properties"
  source "properties.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
    :options => node['sonar']['properties']
  )
  notifies :restart, resources(:service => "sonar")
end

template "wrapper.conf" do
  path "/opt/sonar/conf/wrapper.conf"
  source "properties.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
    :options => node['sonar']['wrapper_properties']
  )
  notifies :restart, resources(:service => "sonar")
end
