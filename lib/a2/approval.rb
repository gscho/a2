module A2
  module Subcommand
    module Approval
      def initialize(name, opts = {})
        super(name, takes_commands: false)
        @opt = {}
        options.on('-y', '--yes', 'Auto accept user deletion prompt') do
          @opt[:yes] = true
        end
      end

      def ask_for_approval(message)
        puts "Are you sure you want to #{message}?"
        puts "Only 'yes' will be accepted to proceed:"
        answer = $stdin.gets.chomp
        puts 'Operation cancelled' unless answer.eql?('yes')
        answer
      end

      def with_approval(message, &block)
        answer = 'yes'
        answer = ask_for_approval(message) unless @opt[:yes]
        block.call if answer.eql?('yes')
      end
    end
  end
end
