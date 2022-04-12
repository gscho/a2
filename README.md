# A2

![build status](https://github.com/gscho/a2-cli/actions/workflows/run-rake.yml/badge.svg?branch=main)
[![Gem Version](https://badge.fury.io/rb/a2.svg)](https://badge.fury.io/rb/a2)

A CLI and ruby client for interacting with Chef Automate 2+ APIs.


## Usage

* [CLI Usage](#using-from-the-command-line)
* [Client Usage](#using-as-an-api-client)

### Using from the command line

Install the CLI via rubygems:

    $ gem install a2

The URL and auth token for your Chef Automate instance must be provided either via command line args or through environment variables. If both are provided, the command line args take precedence.

Environment variables:

```
AUTOMATE_URL="https://automate.example.com"
AUTOMATE_TOKEN="my-token"
AUTOMATE_SSL_NO_VERIFY=true
```

List the available commands:

    $ a2 --help
    Usage: a2 [options] {compliance | help | iam | infra | nodemgmt | version}

    Available commands:
        compliance        Compliance management commands
          export-node-reports
          list-reports
        help              Provide help for individual commands
        iam               Identity access management commands
          add-membership
          create-team
          create-user
          delete-team
          delete-user
          get-team
          get-teams-by-membership
          get-user
          list-team-members
          list-teams
          list-users
          remove-membership
          update-team
          update-user
        infra             Chef Infra config management commands
          list-missing-nodes
          list-node-runs
          list-node-status-counts
          list-nodes
          list-orgs
          show-attributes
          show-node-run
        nodemgmt          Node management commands
          bulk-delete-by-filter
          bulk-delete-by-ids
          delete
          get
          search
        version           Show the version of the program

    Options (take precedence over global options):
        -v, --version                    Show the version of the program

    Global Options:
        -u, --automate-url [url]         The Chef Automate URL
        -t, --automate-token [token]     The Chef Automate API token
        -N, --ssl-no-verify              Disable SSL verification
        -h, --help                       Show help


### Using as an API Client

You can also use the ruby API client directly by adding this line to your application's Gemfile:

```ruby
gem 'a2'
```

And then installing via bundler:

    $ bundle install

Making requests:

```
require 'a2'
client = A2::Client.new(automate_url: 'https://automate.example.com', automate_token: 'my-token', ssl_no_verify: true)
client.list_all_users
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
