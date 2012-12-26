include_recipe "cloudfoundry-rabbitmq-service::install"

%w(base_dir db_logs_dir instances_dir).each do |dir|
  directory node['cloudfoundry_rabbitmq_service']['node'][dir] do
    owner node['cloudfoundry']['user']
    mode  "0755"
  end
end

cloudfoundry_service_component "rabbitmq_node" do
  service_name  "rabbit"
  component     :node
  action        [:create, :enable]
end
