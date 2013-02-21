name             "cloudfoundry-rabbitmq-service"
maintainer       "Andrea Campi"
maintainer_email "andrea.campi@zephirworks.com"
license          "Apache 2.0"
description      "Installs/Configures cloudfoundry-rabbitmq-service"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.1.1"

%w( ubuntu ).each do |os|
  supports os
end

depends "cloudfoundry"
depends "cloudfoundry_service"
