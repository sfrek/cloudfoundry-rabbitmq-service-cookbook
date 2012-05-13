include_recipe "cloudfoundry-rabbitmq-service::install"

cloudfoundry_component "rabbitmq_node" do
  install_path File.join(node.cloudfoundry_common.vcap.install_path, "services", "rabbit")
  bin_file     File.join(node.cloudfoundry_common.vcap.install_path, "bin", "services", "rabbitmq_node")
  pid_file     node.cloudfoundry_rabbitmq_service.node.pid_file
  log_file     node.cloudfoundry_rabbitmq_service.node.log_file
end

directory node.cloudfoundry_rabbitmq_service.node.base_dir do
  owner node.cloudfoundry_common.user
  mode  "0755"
end

directory node.cloudfoundry_rabbitmq_service.node.db_logs_dir do
  owner node.cloudfoundry_common.user
  mode  "0755"
end

directory node.cloudfoundry_rabbitmq_service.node.instances_dir do
  owner node.cloudfoundry_common.user
  mode  "0755"
end
