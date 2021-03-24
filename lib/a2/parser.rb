module A2
  module Parser
    def parse!
      parser = CmdParse::CommandParser.new(handle_exceptions: true)
      parser.main_options.version = A2::VERSION
      parser.add_command(CmdParse::HelpCommand.new)
      parser.add_command(CmdParse::VersionCommand.new)
      parser.add_command(A2::Command::IAM.new)
      parser.add_command(A2::Command::Infra.new)
      parser.add_command(A2::Command::NodeMgmt.new)
      parser.global_options do |opt|
        opt.on("-u", "--automate-url [url]", "The Chef Automate URL") do |url|
          parser.data[:automate_url] = url
        end
        opt.on("-t", "--automate-token [token]", "The Chef Automate API token") do |token|
          parser.data[:automate_token] = token
        end
        opt.on("-N", "--ssl-no-verify", "Disable SSL verification") do
          parser.data[:ssl_no_verify] = true
        end
      end
      parser.parse
    end
  end
end
