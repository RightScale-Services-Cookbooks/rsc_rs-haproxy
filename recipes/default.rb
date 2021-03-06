#
# Cookbook Name:: client-rs-haproxy
# Recipe:: default
#

marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

node.force_default['haproxy']['config']['defaults']['option'] = [ 'forwardfor header x-forwarded-for' ]

include_recipe 'rs-haproxy::default'
