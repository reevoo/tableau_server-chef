if node.tableau_server["backup"]["aws"]["s3_bucket"] && node.tableau_server["backup"]["aws"]["region"]
  directory 'C:\Program Files\Tableau\Backups'

  package "AWS Tools for Windows" do
    source node.tableau_server["backup"]["aws"]["source_uri"]
    checksum node.tableau_server["backup"]["aws"]["checksum"]
    action :install
  end

  backup = Chef::EncryptedDataBagItem.load("tableau_server", node.chef_environment)["backup"]

  directory File.join(Dir.home, ".aws")

  file File.join(Dir.home, '.aws\credentials') do
    content %([default]
aws_access_key_id = #{backup["aws_access_key"]}
aws_secret_access_key = #{backup["aws_secret_access_key"]})
  end

  file File.join(Dir.home, '.aws\config') do
    content "[default]\nregion = #{node.tableau_server["backup"]["aws"]["region"]}"
  end

  template 'C:Program Files\Tableau\backup.bat' do
    source "backup.bat.erb"
    variables(
      aws_access_key_id: backup["aws_access_key"],
      aws_secret_access_key: backup["aws_secret_access_key"],
    )
  end

  windows_task "Tableau Backup" do
    command "backup.bat"
    cwd 'C:\Program Files\Tableau'
    frequency node.tableau_server["backup"]["frequency"]
    start_time node.tableau_server["backup"]["time"]
    action [:create, :enable]
  end
end
