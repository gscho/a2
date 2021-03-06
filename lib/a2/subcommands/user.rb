module A2
  module Subcommand
    module User
      class ListAll < CmdParse::Command
        def initialize
          super('list-users', takes_commands: false)
        end

        def execute
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).list_all_users)
        end
      end
      class Create < CmdParse::Command
        def initialize
          super('create-user', takes_commands: false)
        end

        def execute(id, display_name = id, password)
          json = {
            'id' => id,
            'name' => display_name,
            'password' => password
          }.to_json
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).create_user(json))
        end
      end
      class Get < CmdParse::Command
        def initialize
          super('get-user', takes_commands: false)
        end

        def execute(id)
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).get_user(id))
        end
      end
      class Update < CmdParse::Command
        def initialize
          super('update-user', takes_commands: false)
        end

        def execute(id, display_name, password = nil)
          body = { 'name' => display_name}
          body['password'] = password unless password.nil?

          json = body.to_json
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).update_user(id, json))
        end
      end
      class Delete < CmdParse::Command
        include A2::Approved
        def initialize
          super('delete-user', takes_commands: false)
          @opt = add_approval_option!(options)
        end

        def execute(id)
          with_approval(message: "delete user #{id}", auto_approved: @opt[:auto_approved]) do
            puts JSON.pretty_generate(A2::Client.new(command_parser.data).delete_user(id))
          end
        end
      end
    end
  end
end
