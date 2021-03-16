module A2
  module Parser
    def parse!
      parser = CmdParse::CommandParser.new(handle_exceptions: true)
      parser.add_command(CmdParse::HelpCommand.new)
      parser.add_command(A2::Command::IAM.new)
      parser.global_options do |opt|
        opt.on("-u", "--url [url]", "The Chef Automate URL") do |url|
          parser.data[:url] = url
        end
        opt.on("-t", "--token [token]", "The Chef Automate API token") do |token|
          parser.data[:token] = token
        end
      end
      parser.parse
    end
  end
end
