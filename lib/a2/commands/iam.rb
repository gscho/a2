require_relative '../subcommands/user'
require_relative '../subcommands/team'

module A2
  module Command
    class IAM < CmdParse::Command
      def initialize
        super('iam')
        short_desc('Identity access manangement commands')
        add_command(A2::SubCommand::User.new)
        add_command(A2::SubCommand::Team.new)
      end
    end
  end
end
