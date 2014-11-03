

remote_file '/opt/sonar/extensions/sonar-ldap-plugin.jar' do
  source node['sonar']['ldap_auth']['plugin_url']
  checksum node['sonar']['ldap_auth']['plugin_checksum']
  mode 0644
end

