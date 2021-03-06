marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

package "python" do
  action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/hatop-0.7.7.tar.gz" do
  source "http://hatop.googlecode.com/files/hatop-0.7.7.tar.gz"
  owner "root"
  group "root"
  mode "0644"
  action :create
end

bash "extract and install" do
  code <<-EOF
    tar -xvzf #{Chef::Config[:file_cache_path]}/hatop-0.7.7.tar.gz -C /tmp
    cd /tmp/hatop-0.7.7
    install -m 755 bin/hatop /usr/local/bin
    install -m 644 man/hatop.1 /usr/local/share/man/man1
    gzip /usr/local/share/man/man1/hatop.1
  EOF
end
