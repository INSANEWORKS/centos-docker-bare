#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2014, INSANEWORKS,LLC
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'yum-epel'

%w{docker-io}.each do |p|
  package p do
    action :install
  end
end

%w{docker}.each do |s|
  service s do
    supports [:restart, :reload, :status]
    action [:enable, :start]
  end
end
