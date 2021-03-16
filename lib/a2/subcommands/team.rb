module A2
  module SubCommand
    class Team < CmdParse::Command
      def initialize
        super('team')
        add_command(TeamCommands::ListAll.new)
        add_command(TeamCommands::Create.new)
        add_command(TeamCommands::Get.new)
        add_command(TeamCommands::Update.new)
        add_command(TeamCommands::Delete.new)
        add_command(TeamCommands::ListAllMembership.new)
        add_command(TeamCommands::CreateMembership.new)
        add_command(TeamCommands::GetMembership.new)
        add_command(TeamCommands::DeleteMembership.new)
      end
    end
    module TeamCommands
      class ListAll < CmdParse::Command
        def initialize
          super('list-all', takes_commands: false)
        end

        def execute(name, *opt)
          puts 'list-all'
        end
      end
      class Create < CmdParse::Command
        def initialize
          super('create-user', takes_commands: false)
          options.on('-x', '--example', 'Example option') { puts 'example' }
        end

        def execute(name, *opt)
          puts "Hello #{name}, options: #{opt.join(', ')}"
        end
      end
      class Get < CmdParse::Command
        def initialize
          super('get-user', takes_commands: false)
          options.on('-x', '--example', 'Example option') { puts 'example' }
        end

        def execute(name, *opt)
          puts "Hello #{name}, options: #{opt.join(', ')}"
        end
      end
      class Update < CmdParse::Command
        def initialize
          super('update-user', takes_commands: false)
          options.on('-x', '--example', 'Example option') { puts 'example' }
        end

        def execute(name, *opt)
          puts "Hello #{name}, options: #{opt.join(', ')}"
        end
      end
      class Delete < CmdParse::Command
        def initialize
          super('delete-user', takes_commands: false)
          options.on('-x', '--example', 'Example option') { puts 'example' }
        end

        def execute(name, *opt)
          puts "Hello #{name}, options: #{opt.join(', ')}"
        end
      end
      class ListAllMembership < CmdParse::Command
        def initialize
          super('list-all-membership', takes_commands: false)
          options.on('-x', '--example', 'Example option') { puts 'example' }
        end

        def execute(name, *opt)
          puts "Hello #{name}, options: #{opt.join(', ')}"
        end
      end
      class CreateMembership < CmdParse::Command
        def initialize
          super('create-membership', takes_commands: false)
          options.on('-x', '--example', 'Example option') { puts 'example' }
        end

        def execute(name, *opt)
          puts "Hello #{name}, options: #{opt.join(', ')}"
        end
      end
      class GetMembership < CmdParse::Command
        def initialize
          super('get-membership', takes_commands: false)
          options.on('-x', '--example', 'Example option') { puts 'example' }
        end

        def execute(name, *opt)
          puts "Hello #{name}, options: #{opt.join(', ')}"
        end
      end
      class DeleteMembership < CmdParse::Command
        def initialize
          super('delete-membership', takes_commands: false)
          options.on('-x', '--example', 'Example option') { puts 'example' }
        end

        def execute(name, *opt)
          puts "Hello #{name}, options: #{opt.join(', ')}"
        end
      end
    end
  end
end
