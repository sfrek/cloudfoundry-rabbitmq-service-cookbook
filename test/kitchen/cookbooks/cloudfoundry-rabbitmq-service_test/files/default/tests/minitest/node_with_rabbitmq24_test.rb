require File.expand_path('../support/helpers', __FILE__)

require 'sqlite3'

describe 'cloudfoundry-rabbitmq-service::node' do
  include Helpers::CFServiceRabbitMQTest

  before do
    # Give the service some time to start up.
    sleep 10
  end

  it 'checks out sources with the correct permissions' do
    dirs = [
      '/srv/cloudfoundry/services/rabbit_node',
      '/srv/cloudfoundry/services/rabbit_node/rabbit',
      '/srv/cloudfoundry/services/rabbit_node/rabbit/bundle',
      '/srv/cloudfoundry/services/rabbit_node/rabbit/.bundle'
    ]
    dirs.each do |d|
      directory(d).must_exist.with(:owner, 'cloudfoundry') # .with(:group, 'cloudfoundry')
    end
  end

  it 'creates a config file with the correct permissions' do
    files = [
      '/etc/cloudfoundry/rabbit_node.yml'
    ]
    files.each do |f|
      file(f).must_exist.with(:owner, 'cloudfoundry') # .with(:group, 'cloudfoundry')
    end
  end

  it 'creates a instances dir' do
    directory('/var/vcap/services/rabbit/instances').must_exist.
      with(:owner, 'cloudfoundry').
      with(:group, 'cloudfoundry')
  end

  it 'creates a database' do
    file('/var/vcap/services/rabbit/rabbit_node.db').must_exist.
      with(:owner, 'cloudfoundry').
      with(:group, 'cloudfoundry')
  end

  it 'creates a valid config file' do
    YAML.load_file('/etc/cloudfoundry/rabbit_node.yml')
  end

  it 'creates a config file with the expected content' do
    config = YAML.load_file('/etc/cloudfoundry/rabbit_node.yml')
    {
      "capacity" => 200,
      "plan" => "free",
      "local_db" => "sqlite3:/var/vcap/services/rabbit/rabbit_node.db",
      "mbus" => "nats://nats:nats@localhost:4222/",
      "index" => 0,
      "base_dir" => "/var/vcap/services/rabbit/instances",
      "rabbitmq_log_dir" => "/var/log/cloudfoundry/rabbit",
      "pid" => "/var/run/cloudfoundry/rabbit_node.pid",
      "node_id" => "rabbitmq_node_0",
      "max_clients" => 1000,
      "rabbitmq_start_timeout" => 10,
      "supported_versions" => ["2.4"],
      "default_version" => "2.4",
      "rabbit" => {
        "2.4" => {
          "config_template" => "/srv/cloudfoundry/services/rabbit_node/rabbit/resources/rabbitmq24.config.erb",
          "rabbitmq_server"=> "/srv/rabbitmq/rabbitmq-2.4.1/sbin/rabbitmq-server"
        }
      },
      "port_range" => {
        "first" => 10001,
        "last" => 20000
      },
      "admin_port_range" => {
        "first" => 20001,
        "last" => 30000
      },
      "migration_nfs" => "/mnt/migration",
      "logging" => {
        "level" => "info",
        "file" => "/var/log/cloudfoundry/rabbit_node.log"
      },
      "max_memory_factor" => 0.5,
      "z_interval" => 30,
      "max_nats_payload" => 1048576,
      "fqdn_hosts" => false,
      "op_time_limit" => 8
    }.each do |k,v|
      config[k].must_equal v
    end

    config.has_key?('ip_route').must_equal false
  end

  it 'has no provisioned services' do
    db = sqlite('/var/vcap/services/rabbit/rabbit_node.db')
    rows = db.execute("select * from vcap_services_rabbit_node_provisioned_services")
    rows.must_equal []
  end

protected
  def sqlite(path)
    @sqlite ||= SQLite3::Database.new(path)
  end
end
