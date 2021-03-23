module A2
  module Subcommand
    module Node
      class Get < CmdParse::Command
        def initialize
          super('get', takes_commands: false)
        end

        def execute(id)
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).get_managed_node(id))
        end
      end
      class Search < CmdParse::Command
        include A2::Paginated

        def initialize
          super('search', takes_commands: false)
        end

        def execute
          with_paginated_filter_json do |json|
            puts JSON.pretty_generate(A2::Client.new(command_parser.data).search_managed_nodes(json))
          end
        end
      end
      class Delete < CmdParse::Command
        include A2::Approved

        def initialize
          super('delete', takes_commands: false)
        end

        def execute(id)
          with_approval("delete node #{id}") do
            puts JSON.pretty_generate(A2::Client.new(command_parser.data).delete_managed_node(id))
          end
        end
      end
      class BulkDeleteById < CmdParse::Command
        include A2::Approved

        def initialize
          super('bulk-delete-by-ids', takes_commands: false)
        end

        def execute(ids)
          with_approval("delete nodes") do
            puts JSON.pretty_generate(A2::Client.new(command_parser.data).bulk_delete_managed_nodes_by_id(id))
          end
        end
      end
      class BulkDeleteByFilter < CmdParse::Command
        include A2::Approved
        include A2::Paginated

        def initialize
          super('bulk-delete-by-filter', takes_commands: false)
        end

        def execute
          with_paginated_filter_json do |json|
            with_approval("delete nodes using filter") do
              puts JSON.pretty_generate(A2::Client.new(command_parser.data).bulk_delete_managed_nodes_by_filter(json))
            end
          end
        end
      end
    end
  end
end
