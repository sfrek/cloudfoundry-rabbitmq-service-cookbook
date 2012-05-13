cloudfoundry_component "rabbitmq_gateway" do
  install_path File.join(node.cloudfoundry_common.vcap.install_path, "services", "rabbit")
  bin_file     File.join(node.cloudfoundry_common.vcap.install_path, "bin", "services", "rabbitmq_gateway")
  pid_file     node.cloudfoundry_rabbitmq_service.gateway.pid_file
  log_file     node.cloudfoundry_rabbitmq_service.gateway.log_file
end
