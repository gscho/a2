module A2
  module SubCommand
    class Team < CmdParse::Command
      def initialize
        super('team')
        add_command(ListAll.new)
        add_command(Create.new)
        add_command(Get.new)
        add_command(Update.new)
        add_command(Delete.new)
        add_command(ListAllMembership.new)
        add_command(CreateMembership.new)
        add_command(GetMembership.new)
        add_command(DeleteMembership.new)
      end
    end
    class ListAll < CmdParse::Command
      def initialize
        super('list-all', takes_commands: false)
        options.on('-x', '--example', 'Example option') { puts 'example' }
      end

      def execute(name, *opt)
        puts "Hello #{name}, options: #{opt.join(', ')}"
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
