module A2
  module SubCommand
    class User < CmdParse::Command
      def initialize
        super('user')
        add_command(UserCommands::ListAll.new)
        add_command(UserCommands::Create.new)
        add_command(UserCommands::Get.new)
        add_command(UserCommands::Update.new)
        add_command(UserCommands::Delete.new)
      end
    end
    module UserCommands
      class ListAll < CmdParse::Command
        def initialize
          super('list-all', takes_commands: false)
        end

        def execute(*opt)
          puts command_parser.data[:url]
        end
      end
      class Create < CmdParse::Command
        def initialize
          super('create-user', takes_commands: false)
        end

        def execute(name, *opt)
          puts 'create-user'
        end
      end
      class Get < CmdParse::Command
        def initialize
          super('get-user', takes_commands: false)
        end

        def execute(name, *opt)
          puts 'get-user'
        end
      end
      class Update < CmdParse::Command
        def initialize
          super('update-user', takes_commands: false)
        end

        def execute(name, *opt)
          puts 'update-user'
        end
      end
      class Delete < CmdParse::Command
        def initialize
          super('delete-user', takes_commands: false)
        end

        def execute(name, *opt)
          puts 'delete-user'
        end
      end
    end
  end
end
