require_relative '../subcommands/infra'

module A2
  module Command
    class Infra < CmdParse::Command
      def initialize
        super('infra')
        short_desc('Chef Infra config management commands')
        long_desc('Chef Infra config management commands')
        add_command(A2::Subcommand::Infra::ListAllCheckedInNodes.new)
        add_command(A2::Subcommand::Infra::ListMissingNodesCount.new)
        add_command(A2::Subcommand::Infra::ListNodeRuns.new)
        add_command(A2::Subcommand::Infra::ListNodeStatusCounts.new)
        add_command(A2::Subcommand::Infra::ListOrganizations.new)
        add_command(A2::Subcommand::Infra::ShowAttributes.new)
        add_command(A2::Subcommand::Infra::ShowNodeRun.new)
      end
    end
  end
end
