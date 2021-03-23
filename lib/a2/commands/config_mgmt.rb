require_relative '../subcommands/config_mgmt'

module A2
  module Command
    class ConfigMgmt < CmdParse::Command
      def initialize
        super('cfgmgmt')
        short_desc('Chef Infra config management commands')
        long_desc('Chef Infra config management commands')
        add_command(A2::Subcommand::ConfigMgmt::ListAllCheckedInNodes.new)
        add_command(A2::Subcommand::ConfigMgmt::ListMissingNodesCount.new)
        add_command(A2::Subcommand::ConfigMgmt::ListNodeStatusCounts.new)
        add_command(A2::Subcommand::ConfigMgmt::ListOrganizations.new)
        add_command(A2::Subcommand::ConfigMgmt::ShowAttributes.new)
      end
    end
  end
end
