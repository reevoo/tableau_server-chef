default["tableau_server"]["version"] = "9.2"
default["tableau_server"]["build"] = "9200.16.0204.1543"
default["tableau_server"]["source"] = "https://downloads.tableau.com/esdalt/9.2.4/TableauServer-64bit-9-2-4.exe"
default["tableau_server"]["checksum"] = "e21048d8ec59327ae0d05c313ad68efab59826d87c5549122001903ffc7d2583"

default["tableau_server"]["redshift"]["driver"]["name"]       = "Amazon Redshift (x64)"
default["tableau_server"]["redshift"]["driver"]["source_uri"] = "https://s3.amazonaws.com" \
                         "/redshift-downloads/drivers/AmazonRedshiftODBC64-1.2.6.1006.msi"
default["tableau_server"]["redshift"]["driver"]["checksum"]   = "23530d6215140f0f8b06c128" \
                                                "68c5ce271485a95cbfbdfc1e4479a2b4f8e5532c"

default["tableau_server"]["redshift"]["name"] = nil
default["tableau_server"]["redshift"]["database"] = nil
default["tableau_server"]["redshift"]["host"] = nil
default["tableau_server"]["redshift"]["port"] = "5439"
default["tableau_server"]["redshift"]["proxy"]["host"] = ""
default["tableau_server"]["redshift"]["proxy"]["port"] = ""
default["tableau_server"]["redshift"]["ssl_mode"]                = "require"
default["tableau_server"]["redshift"]["bools_as_char"]           = "1"
default["tableau_server"]["redshift"]["fetch"]                   = "100"
default["tableau_server"]["redshift"]["max_bytea"]               = "255"
default["tableau_server"]["redshift"]["max_long_varchar"]        = "8190"
default["tableau_server"]["redshift"]["max_varchar"]             = "255"
default["tableau_server"]["redshift"]["single_row_mode"]         = "0"
default["tableau_server"]["redshift"]["text_as_long_varchar"]    = "1"
default["tableau_server"]["redshift"]["use_declare_fetch"]       = "0"
default["tableau_server"]["redshift"]["use_multiple_statements"] = "0"
default["tableau_server"]["redshift"]["use_unicode"]             = "1"

default["tableau_server"]["backup"]["frequency"] = :daily
default["tableau_server"]["backup"]["time"] = "23:00"
default["tableau_server"]["backup"]["aws"]["source_uri"] = "https://s3.amazonaws.com/aws-cli/AWSCLI64.msi"
default["tableau_server"]["backup"]["aws"]["checksum"] = "0385f9041a33d0ff9f7b954e12c0bec" \
                                                       "8f67bef1e30f990394f5fc784162fafdd"
default["tableau_server"]["backup"]["aws"]["s3_bucket"] = nil
default["tableau_server"]["backup"]["aws"]["region"] = nil
