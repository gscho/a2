module A2
  module Parser
    def parse!
      parser = CmdParse::CommandParser.new(handle_exceptions: true)
      parser.add_command(CmdParse::HelpCommand.new)
      parser.add_command(A2::Command::IAM.new)
      parser.parse
    end
  end
end
