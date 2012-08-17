#
# Cookbook Name:: rabbitmq
# Recipe:: default
#
# Copyright 2011, VMware
#
#

case node.platform
when "ubuntu"
  package "erlang-nox"

  remote_file File.join("", "tmp", "rabbitmq-server-#{node['cloudfoundry_rabbitmq_service']['version_full']}.tar.gz") do
    owner node['cloudfoundry']['user']
    source node['cloudfoundry_rabbitmq_service']['source']
    not_if { ::File.exists?(File.join("", "tmp", "rabbitmq-server-#{node['cloudfoundry_rabbitmq_service']['version_full']}.tar.gz")) }
  end

  node['cloudfoundry_rabbitmq_service']['plugins'].each do |plugin_name|
    remote_file File.join("", "tmp", "#{plugin_name}-#{node['cloudfoundry_rabbitmq_service']['version']}.ez") do
      owner node['cloudfoundry']['user']
      source "#{node['cloudfoundry_rabbitmq_service']['plugins_source']}#{plugin_name}-#{node['cloudfoundry_rabbitmq_service']['version']}.ez"
      not_if { ::File.exists?(File.join("", "tmp", "#{plugin_name}-#{node['cloudfoundry_rabbitmq_service']['version']}.ez")) }
    end
  end

  directory node['cloudfoundry_rabbitmq_service']['path'] do
    owner node['cloudfoundry']['user']
    mode "0755"
    recursive true
  end

  bash "Install RabbitMQ" do
    cwd File.join("", "tmp")
    user node['cloudfoundry']['user']
    code <<-EOH
    tar xzf rabbitmq-server-#{node['cloudfoundry_rabbitmq_service']['version_full']}.tar.gz
    cd rabbitmq_server-#{node['cloudfoundry_rabbitmq_service']['version']}
    cp -rf * #{node['cloudfoundry_rabbitmq_service']['path']}
    EOH
    not_if do
      ::File.exists?(File.join(node['cloudfoundry_rabbitmq_service']['path'], "sbin", "rabbitmq-server"))
    end
  end

  node['cloudfoundry_rabbitmq_service']['plugins'].each do |plugin_name|
    bash "Install RabbitMQ #{plugin_name} plugin" do
      cwd File.join("", "tmp")
      user node['cloudfoundry']['user']
      code <<-EOH
      cp -f "#{plugin_name}-#{node['cloudfoundry_rabbitmq_service']['version']}.ez" #{File.join(node['cloudfoundry_rabbitmq_service']['path'], "plugins")}
      EOH
      not_if do
        ::File.exists?(File.join(node['cloudfoundry_rabbitmq_service']['path'], "plugins", "#{plugin_name}-#{node['cloudfoundry_rabbitmq_service']['version']}.ez"))
      end
    end
  end
else
  Chef::Log.error("Installation of rabbitmq packages not supported on this platform.")
end
