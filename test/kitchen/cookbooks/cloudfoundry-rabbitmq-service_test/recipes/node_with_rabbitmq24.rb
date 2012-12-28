include_recipe "cloudfoundry-rabbitmq-service_test::install"
include_recipe "cloudfoundry-rabbitmq-service::install"

include_recipe "cloudfoundry-rabbitmq-service_test::node"

node.default['cloudfoundry_rabbitmq_service']['node']['default_version'] = "2.4"

include_recipe "cloudfoundry-rabbitmq-service::node"
