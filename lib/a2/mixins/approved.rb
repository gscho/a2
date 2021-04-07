module A2
  module Approved
    def add_approval_option!(options, opt = {})
      options.on('-y', '--yes', 'Auto approve the deletion prompt.') do
        opt[:auto_approved] = true
      end
      opt
    end

    def ask_for_approval(message = '')
      puts "Are you sure you want to #{message}?"
      puts "Only 'yes' will be accepted to proceed:"
      answer = $stdin.gets.chomp
      abort('Operation cancelled') unless answer.eql?('yes')
      answer
    end

    def with_approval(opts, &block)
      opts[:auto_approved] = opts[:auto_approved] || false
      answer = 'yes'
      answer = ask_for_approval(opts[:message]) unless opts[:auto_approved]
      block.call if answer.eql?('yes')
    end
  end
end
