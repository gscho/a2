module A2
  module SubCommand
    class User < CmdParse::Command
      def initialize
        super('user')
        short_desc('iam user')
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

        def execute
          A2::Client.new(command_parser.data).list_all_users
        end
      end
      class Create < CmdParse::Command
        def initialize
          super('create', takes_commands: false)
        end

        def execute
          puts 'create'
        end
      end
      class Get < CmdParse::Command
        def initialize
          super('get', takes_commands: false)
          @opt = {}
          options.on('-i', '--id ID', 'User ID') do |id|
            @opt[:id] = id
          end
        end

        def execute
          raise A2::Error, "Must provide a user ID" if @opt[:id].nil?

          A2::Client.new(command_parser.data).get_user(@opt[:id])
        end
      end
      class Update < CmdParse::Command
        def initialize
          super('update', takes_commands: false)
          @opt = {}
          options.on('-i', '--id ID', 'User ID') do |id|
            @opt[:id] = id
          end
        end

        def execute
          puts 'update'
        end
      end
      class Delete < CmdParse::Command
        def initialize
          super('delete', takes_commands: false)
          @opt = {}
          options.on('-i', '--id ID', 'User ID') do |id|
            @opt[:id] = id
          end
        end

        def ask_for_approval
          puts "Are you sure you want to delete user #{@opt[:id]}?"
          puts "Only 'yes' will be accepted to proceed:"
          answer = $stdin.gets.chomp
          puts 'Operation cancelled' unless answer.eql?('yes')
          answer
        end

        def execute
          raise A2::Error, "Must provide a user ID" if @opt[:id].nil?

          answer = 'yes'
          answer = ask_for_approval unless @opt[:yes]

          A2::Client.new(command_parser.data).delete_user(@opt[:id]) if answer.eql?('yes')
        end
      end
    end
  end
end
