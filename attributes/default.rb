default['haproxy']['config']['defaults']['options'] << 'x_forwarded_for'
default['haproxy']['config']['defaults']['timeout'] = {
  'client' => '20s',
  'server' => '20s',
  'connect' => '20s'
}
