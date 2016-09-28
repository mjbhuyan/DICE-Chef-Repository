#
# Cookbook Name:: zookeeper
# Attribute:: default
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

# General settings
default['zookeeper']['install_dir'] = '/usr/share/zookeeper'
default['zookeeper']['conf_dir'] = '/etc/zookeeper'
default['zookeeper']['data_dir'] = '/var/lib/zookeeper'
default['zookeeper']['log_dir'] = '/var/log/zookeeper'
default['zookeeper']['user'] = 'zookeeper'
default['zookeeper']['tarball'] =
  'http://www.apache.si/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz'
default['zookeeper']['checksum'] =
  'e7f340412a61c7934b5143faef8d13529b29242ebfba2eba48169f4a8392f535'

# Zookeeper configuration
default['zookeeper']['zoo.cfg']['dataDir'] = '/var/lib/zookeeper'
default['zookeeper']['zoo.cfg']['tickTime'] = 2000
default['zookeeper']['zoo.cfg']['clientPort'] = 2181
default['zookeeper']['zoo.cfg']['initLimit'] = 5
default['zookeeper']['zoo.cfg']['syncLimit'] = 2
