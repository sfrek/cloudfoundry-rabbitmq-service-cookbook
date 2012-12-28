include_recipe "cloudfoundry::user"
include_recipe "nats::server"

%w[sqlite3 libsqlite3-ruby libsqlite3-dev].each do |p|
  package(p).run_action(:install)
end
chef_gem "sqlite3"  # only for tests
