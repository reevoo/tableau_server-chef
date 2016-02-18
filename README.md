tableau_server Cookbook
================
Installs Tableau Server

Usage
-----
#### `tableau::server`
Installs Tableau Server

* Create the tableau server encrypted databag for the chef environment you are targeting
* Configure the product key
e.g.

```json
{
  "product_key": "NOT-A-REAL-PRODUCT-KEY-X99"
}
```
* Add `tableau::server` to your node's run list

#### `tableau_server::redshift`
Installs the redshift driver and sets up an ODBC dsn.

* Configure the `['tableau_server']['redshift']['name']`, `['tableau_server']['redshift']['database']` and `['tableau_server']['redshift']['host']` attributes.
* Add the username and password to the tableau_server databag
e.g.

```json
{
  "redshift": {
    "username": "susan",
    "password": "youWiLLNEverGuess"
  }
}
```
* Add `tableau::redshift` to your node's run list

#### `tableau_server::backup`
Sets up a (nightly) task to backup Tableau Server to a s3 bucket

* Configure the `['tableau_server']['backup']['aws']['s3_bucket']` and `['tableau_server']['backup']['aws']['region']` attributes.
* Add the aws keys to the tableau_server databag
e.g.

```json
{
  "backup": {
    "aws_access_key": "NOTAREALKEY",
    "aws_secret_access_key": "NOTEVENREMOTLYSECRET"
  }
}
```
* Add `tableau::backup` to your node's run list


Requirements
------------
#### cookbooks
- [`windows`](https://supermarket.chef.io/cookbooks/windows)
- [`windows_firewall`] (https://supermarket.chef.io/cookbooks/windows_firewall)

Attributes
----------
#### `tableau_server::server`

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `['tableau_server']['version']` | string | The major and minor version of tableau server to install | `'9.2'` |
| `['tableau_server']['build']` | string | The build number of tableau server to install | `'9200.16.0204.1543'` |
| `['tableau_server']['source']` | string | the uri or path to install tableau from [see](http://www.tableau.com/support/esdalt) | `'https://downloads.tableau.com/esdalt/9.2.4/TableauServer-64bit-9-2-4.exe'` |
| `['tableau_server']['checksum']` | string | sha256 checksum for the installer | `'e21048d8ec59327ae0d05c313ad68efab59826d87c5549122001903ffc7d2583'` |
##### encrypted data bag `tableau_server <chef_environment>`
| Key | Type | Description |
|-----|------|-------------|
| `product_key` | string | Your tableau server product key |

#### `tableau_server::redshift`

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `['tableau_server']['redshift']['name']` | string | The name for the redshift ODBC DSN | `nil` |
| `['tableau_server']['redshift']['database']` | string | the name of the database | `nil` |
| `['tableau_server']['redshift']['host']` | string | the hostname of your redshift cluster | `nil` |
| `['tableau_server']['redshift']['port']` | string | the redshift port number | `'5439'` |
| `['tableau_server']['redshift']['proxy']['host']` | string | proxy hostname (if used) | `''` |
| `['tableau_server']['redshift']['proxy']['port']` | string | proxy port number (if used) | `''` |
| `['tableau_server']['redshift']['ssl_mode']` | string | ssl mode | `'require'` |
| `['tableau_server']['redshift']['bools_as_char']` | string | | `'1'` |
| `['tableau_server']['redshift']['fetch']` | string | | `'100'` |
| `['tableau_server']['redshift']['max_bytea']` | string | | `'255'` |
| `['tableau_server']['redshift']['max_long_varchar']` | string | | `'8190'` |
| `['tableau_server']['redshift']['max_varchar']` | string | | `'255'` |
| `['tableau_server']['redshift']['single_row_mode']` | string | | `'0'` |
| `['tableau_server']['redshift']['text_as_long_varchar']` | string | | `'1'` |
| `['tableau_server']['redshift']['use_declare_fetch']` | string | | `'0'` |
| `['tableau_server']['redshift']['use_multiple_statements']` | string | | `'0'` |
| `['tableau_server']['redshift']['use_unicode']` | string | | `'1'` |
##### encrypted data bag `tableau_server <chef_environment>`
| Key | Type | Description |
|-----|------|-------------|
| `['redshift']['username']` | string | the username for your redshift cluster |
| `['redshift']['password']` | string | the password for your redshift cluster |


#### `tableau_server::backup`

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `['tableau_server']['backup']['frequency']` | symbol | How often to backup tableau one of `:minute, :hourly, :daily, :weekly, :monthly, :once, :on_logon, :onstart, :on_idle` | `:daily` |
| `['tableau_server']['backup']['time']` | string | Specifies the start time to run the backup (HH:mm) | `'23:00'` |
| `['tableau_server']['backup']['aws']['source']` | string | The source uri or path to install the aws cli tools from  | `"https://s3.amazonaws.com/aws-cli/AWSCLI64.msi"` |
| `['tableau_server']['backup']['aws']['checksum']` | string | Checksum for the cli tools installer | ` "0385f9041a33d0ff9f7b954e12c0bec8f67bef1e30f990394f5fc784162fafdd"` |
| `['tableau_server']['backup']['aws']['s3_bucket']` | string | the name of the s3 bucket to backup to | `nil` |
| `['tableau_server']['backup']['aws']['region']` | string | the aws region of the backup bucket | `nil` |
##### encrypted data bag `tableau_server <chef_environment>`
| Key | Type | Description |
|-----|------|-------------|
| `['backup']['aws_access_key']` | string | The aws_access_key_id with access to the backup bucket |
| `['backup']['aws_secret_access_key']` | string | The aws_secret_access_key with access to the bucket |


Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch
3. Write your change(s)
4. Check everything works
5. Submit a Pull Request using Github

Bugs / Issues / Feature Requests
--------------------------------
Open an issue here on github

Todo / Roadmap
--------------
* Test Kitchen / CI (If it's possible on windows)
* Configure All The Things

Contributors
------------
Ed Robinson <ed@reevoo.com>
