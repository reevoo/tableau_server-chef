package "Tableau Server #{node.tableau_server["version"]} (#{node.tableau_server["build"]})" do
  source node.tableau_server["source"]
  version node.tableau_server["version"]
  installer_type :custom
  action :install
  checksum node.tableau_server["checksum"]
  options "/verysilent"
end

databag = Chef::EncryptedDataBagItem.load("tableau_server", node.chef_environment)

# It is a pain that we have to run this every chef run but I can't find a
# way to check if we have already registered.
execute "Register Tableau Server" do
  command "tabinstallck.exe -activate #{databag["product_key"]}"
  cwd 'C:\Program Files\Tableau\Tableau Server\\' + node.tableau_server["version"] + '\bin'
end

windows_firewall_rule "Tableau Server" do
  protocol "TCP"
  localport "80"
  firewall_action :allow
end

windows_firewall_rule "Tableau Server (HTTPS)" do
  protocol "TCP"
  localport "443"
  firewall_action :allow
end
