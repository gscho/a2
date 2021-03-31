module A2
  module Subcommand
    module Infra
      class ListAllCheckedInNodes < Paginated
        def initialize
          super('list-nodes', takes_commands: false, query_filter: true)
        end

        def execute
          with_paginated_filter_query do |query_string|
            puts JSON.pretty_generate(A2::Client.new(command_parser.data).list_all_checked_in_nodes(query_string))
          end
        end
      end
      class ListMissingNodesCount < CmdParse::Command
        def initialize
          super('list-missing-nodes', takes_commands: false)
          @opt = {}
          options.on('-d', '--durations DURATIONS', "A comma-separated list of durations. A valid duration is any number zero or greater with one of these characters 'h', 'd', 'w', or 'M'. 'h' is hours 'd' is days 'w' is weeks 'M' is months Will contain one or many.") do |durations|
            @opt[:durations] = durations.split(',').join('&durations=').prepend('?durations=')
          end
        end

        def execute
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).list_all_missing_nodes_count(@opt[:durations]))
        end
      end
      class ListNodeRuns < Paginated
        def initialize
          super('list-node-runs', takes_commands: false, query_filter: true, disable_sort_opts: true)
        end

        def execute(node_id)
          with_paginated_filter_query do |query_string|
            puts JSON.pretty_generate(A2::Client.new(command_parser.data).list_all_node_runs(node_id, query_string))
          end
        end
      end
      class ListNodeStatusCounts < Filtered
        def initialize
          super('list-node-status-counts', takes_commands: false, query_filter: true)
        end

        def execute
          with_filter_query do |query_filter|
            puts JSON.pretty_generate(A2::Client.new(command_parser.data).list_all_node_status_counts(query_filter))
          end
        end
      end
      class ListOrganizations < CmdParse::Command
        def initialize
          super('list-orgs', takes_commands: false)
        end

        def execute
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).list_all_organizations)
        end
      end
      class ShowAttributes < CmdParse::Command
        def initialize
          super('show-attributes', takes_commands: false)
        end

        def execute(node_id)
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).show_attributes(node_id))
        end
      end
      class ShowNodeRun < CmdParse::Command
        def initialize
          super('show-node-run', takes_commands: false)
          @opt = {}
          options.on('-E', '--end-time END', "End time on the node's run. Formatted iso8601 (YYYY-MM-DD\'T\'HH:mm:ssZ)") do |end_time|
            @opt[:end_time] = end_time
          end
        end

        def execute(node_id, run_id)
          query_string = ''
          query_string = "?end_time=#{@opt[:end_time]}" if @opt[:end_time]

          puts JSON.pretty_generate(A2::Client.new(command_parser.data).show_node_run(node_id, run_id, query_string))
        end
      end
    end
  end
end
