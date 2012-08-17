cloudfoundry_service_component "rabbitmq_gateway" do
  service_name  "rabbit"
  component     :gateway
  action        [:create, :enable]
end
