include_attribute "cloudfoundry-common"

# Where to write the rabbitmq service gateway's pid.
default[:cloudfoundry_rabbitmq_service][:gateway][:pid_file] = File.join(node.cloudfoundry_common.pid_dir, "rabbit_gateway.pid")

# Where to write the rabbitmq service gateway's logs.
default[:cloudfoundry_rabbitmq_service][:gateway][:log_file] = File.join(node.cloudfoundry_common.log_dir, "rabbit_gateway.log")

# Log level for the msyql service gateway.
default[:cloudfoundry_rabbitmq_service][:gateway][:log_level] = "info"

# TODO (trotter): Find out what this does.
default[:cloudfoundry_rabbitmq_service][:gateway][:node_timeout] = 30

# Where to write the rabbitmq service node's pid.
default[:cloudfoundry_rabbitmq_service][:node][:pid_file] = File.join(node.cloudfoundry_common.pid_dir, "rabbit_node.pid")

# Where to write the rabbitmq service node's logs.
default[:cloudfoundry_rabbitmq_service][:node][:log_file] = File.join(node.cloudfoundry_common.log_dir, "rabbit_node.log")

# Where to write the rabbitmq service node's logs.
default[:cloudfoundry_rabbitmq_service][:node][:db_logs_dir] = File.join(node.cloudfoundry_common.log_dir, "rabbit")

# TODO (trotter): Find out what this does.
default[:cloudfoundry_rabbitmq_service][:node][:base_dir] = File.join(node.cloudfoundry_common.services_dir, "rabbit")

# Log level for the msyql service node.
default[:cloudfoundry_rabbitmq_service][:node][:log_level] = "info"

# TODO (trotter): Find out what this does.
default[:cloudfoundry_rabbitmq_service][:node][:index] = 0

# TODO (trotter): Find out what this does.
default[:cloudfoundry_rabbitmq_service][:node][:capacity] = 200

# TODO (trotter): Find out what this does.
default[:cloudfoundry_rabbitmq_service][:node][:instances_dir] = "#{node.cloudfoundry_rabbitmq_service.node.base_dir}/instances"

default[:cloudfoundry_rabbitmq_service][:node][:port_range][:first] = 10001
default[:cloudfoundry_rabbitmq_service][:node][:port_range][:last] = 20000
default[:cloudfoundry_rabbitmq_service][:node][:admin_port_range][:first] = 20001
default[:cloudfoundry_rabbitmq_service][:node][:admin_port_range][:last] = 30000

# TODO (trotter): Find out what this does.
default[:cloudfoundry_rabbitmq_service][:node][:migration_nfs] = "/mnt/migration"

default[:cloudfoundry_rabbitmq_service][:node][:max_clients] = 1000
