#
# Cookbook Name:: hadoop-upstream
# Recipe:: resourcemanager
#
# Copyright 2016, XLAB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Run commmon stuff
include_recipe "hadoop-upstream::default"
hadoop_home = "#{node["prefix"]}/#{node["hadoop-version"]}"

user "yarn" do
  home "/home/yarn"
  shell "/bin/bash"
end

directory "#{node["yarn-env"]["YARN_LOG_DIR"]}" do
  mode "0755"
  owner "yarn"
  group "yarn"
  action :create
  recursive true
end

template "/etc/init/resourcemanager.conf" do
  source "init.conf.erb"
  mode "0644"
  owner "root"
  group "root"
  action :create
  variables :opts => {
    "description" => "Hadoop YARN resourcemanager",
    "runner" => "#{hadoop_home}/sbin/yarn-daemon.sh",
    "config" => "#{node["conf-dir"]}",
    "service" => "resourcemanager",
    "user" => "yarn"
  }
end

service "resourcemanager" do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end
