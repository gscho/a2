module A2
  module SubCommand
    class User < CmdParse::Command
      def initialize
        super('user')
        add_command(ListAll.new)
        add_command(Create.new)
        add_command(Get.new)
        add_command(Update.new)
        add_command(Delete.new)
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
  end
end
