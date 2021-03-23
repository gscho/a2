require_relative '../subcommands/user'
require_relative '../subcommands/team'

module A2
  module Command
    class IAM < CmdParse::Command
      def initialize
        super('iam')
        short_desc('Identity access management commands')
        add_command(A2::Subcommand::User::ListAll.new)
        add_command(A2::Subcommand::User::Create.new)
        add_command(A2::Subcommand::User::Get.new)
        add_command(A2::Subcommand::User::Update.new)
        add_command(A2::Subcommand::User::Delete.new)
        add_command(A2::Subcommand::Team::ListAll.new)
        add_command(A2::Subcommand::Team::Create.new)
        add_command(A2::Subcommand::Team::Get.new)
        add_command(A2::Subcommand::Team::Update.new)
        add_command(A2::Subcommand::Team::Delete.new)
        add_command(A2::Subcommand::Team::ListAllMembership.new)
        add_command(A2::Subcommand::Team::AddMembership.new)
        add_command(A2::Subcommand::Team::GetTeamsByMembership.new)
        add_command(A2::Subcommand::Team::RemoveMembership.new)
      end
    end
  end
end
