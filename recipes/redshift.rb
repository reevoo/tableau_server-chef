redshift = node.tableau_server["redshift"]

if redshift["name"] && redshift["host"] && redshift["database"]
  package redshift["driver"]["name"] do
    source redshift["driver"]["source_uri"]
    checksum redshift["driver"]["checksum"]
  end

  databag = Chef::EncryptedDataBagItem.load("tableau_server", node.chef_environment)["redshift"]

  registry_key "HKEY_LOCAL_MACHINE\\SOFTWARE\\ODBC\\ODBC.INI\\#{redshift["name"]}" do
    values [
      { type: :string, name: "Driver",                data: redshift["driver"]["name"] },
      { type: :string, name: "Database",              data: redshift["database"] },
      { type: :string, name: "UID",                   data: databag["username"] },
      { type: :string, name: "PWD",                   data: databag["password"] },
      { type: :string, name: "Server",                data: redshift["host"] },
      { type: :string, name: "Port",                  data: redshift["port"] },
      { type: :string, name: "ProxyHost",             data: redshift["proxy"]["host"] },
      { type: :string, name: "ProxyPort",             data: redshift["proxy"]["port"] },
      { type: :string, name: "SSLMode",               data: redshift["ssl_mode"] },
      { type: :string, name: "BoolsAsChar",           data: redshift["bools_as_char"] },
      { type: :string, name: "Fetch",                 data: redshift["fetch"] },
      { type: :string, name: "MaxBytea",              data: redshift["max_bytea"] },
      { type: :string, name: "MaxLongVarchar",        data: redshift["max_long_varchar"] },
      { type: :string, name: "MaxVarchar",            data: redshift["max_varchar"] },
      { type: :string, name: "SingleRowMode",         data: redshift["single_row_mode"] },
      { type: :string, name: "TextAsLongVarchar",     data: redshift["text_as_long_varchar"] },
      { type: :string, name: "UseDeclareFetch",       data: redshift["use_declare_fetch"] },
      { type: :string, name: "UseMultipleStatements", data: redshift["use_multiple_statements"] },
      { type: :string, name: "UseUnicode",            data: redshift["use_unicode"] },
    ]
  end
end
