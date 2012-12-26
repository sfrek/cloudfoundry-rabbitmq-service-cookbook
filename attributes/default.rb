#
# Cookbook Name:: cloudfoundry-rabbitmq-service
# Attributes:: default
#
# Copyright 2012, ZephirWorks
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

include_attribute "cloudfoundry"

# Log level for the msyql service gateway.
default['cloudfoundry_rabbitmq_service']['gateway']['log_level'] = "info"

# TODO (trotter): Find out what this does.
default['cloudfoundry_rabbitmq_service']['gateway']['node_timeout'] = 30

# Where to write the rabbitmq service node's logs.
default['cloudfoundry_rabbitmq_service']['node']['db_logs_dir'] = File.join(node['cloudfoundry']['log_dir'], "rabbit")

# TODO (trotter): Find out what this does.
default['cloudfoundry_rabbitmq_service']['node']['base_dir'] = File.join(node['cloudfoundry']['services_dir'], "rabbit")

# Log level for the msyql service node.
default['cloudfoundry_rabbitmq_service']['node']['log_level'] = "info"

# TODO (trotter): Find out what this does.
default['cloudfoundry_rabbitmq_service']['node']['index'] = 0

# TODO (trotter): Find out what this does.
default['cloudfoundry_rabbitmq_service']['node']['capacity'] = 200

# TODO (trotter): Find out what this does.
default['cloudfoundry_rabbitmq_service']['node']['instances_dir'] = "#{node['cloudfoundry_rabbitmq_service']['node']['base_dir']}/instances"

default['cloudfoundry_rabbitmq_service']['node']['port_range']['first']= 10001
default['cloudfoundry_rabbitmq_service']['node']['port_range']['last']= 20000
default['cloudfoundry_rabbitmq_service']['node']['admin_port_range']['first']= 20001
default['cloudfoundry_rabbitmq_service']['node']['admin_port_range']['last']= 30000

# TODO (trotter): Find out what this does.
default['cloudfoundry_rabbitmq_service']['node']['migration_nfs'] = "/mnt/migration"

default['cloudfoundry_rabbitmq_service']['node']['max_clients'] = 1000
