default[:cloudfoundry_rabbitmq_service][:version] = "2.4.1"
default[:cloudfoundry_rabbitmq_service][:version_full] = "generic-unix-2.4.1"
default[:cloudfoundry_rabbitmq_service][:path] = File.join("", "srv", "rabbitmq", "rabbitmq-#{node[:cloudfoundry_rabbitmq_service][:version]}")
default[:cloudfoundry_rabbitmq_service][:source] = "http://www.rabbitmq.com/releases/rabbitmq-server/v#{node[:cloudfoundry_rabbitmq_service][:version]}/rabbitmq-server-#{node[:cloudfoundry_rabbitmq_service][:version_full]}.tar.gz"
default[:cloudfoundry_rabbitmq_service][:plugins] = ["amqp_client", "mochiweb", "rabbitmq-management", "rabbitmq-management-agent", "rabbitmq-mochiweb", "webmachine"]
default[:cloudfoundry_rabbitmq_service][:plugins_source] = "http://www.rabbitmq.com/releases/plugins/v#{node[:cloudfoundry_rabbitmq_service][:version]}/"
