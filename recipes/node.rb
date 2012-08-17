include_recipe "cloudfoundry-rabbitmq-service::install"

directory node['cloudfoundry_rabbitmq_service']['node']['base_dir'] do
  owner node['cloudfoundry']['user']
  mode  "0755"
end

directory node['cloudfoundry_rabbitmq_service']['node']['db_logs_dir'] do
  owner node['cloudfoundry']['user']
  mode  "0755"
end

directory node['cloudfoundry_rabbitmq_service']['node']['instances_dir'] do
  owner node['cloudfoundry']['user']
  mode  "0755"
end

cloudfoundry_service_component "rabbitmq_node" do
  service_name  "rabbit"
  component     :node
  action        [:create, :enable]
end
