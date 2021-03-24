require_relative '../subcommands/node_mgmt'

module A2
  module Command
    class NodeMgmt < CmdParse::Command
      def initialize
        super('nodemgmt')
        short_desc('Node management commands')
        long_desc('Node management commands')
        add_command(A2::Subcommand::NodeMgmt::Get.new)
        add_command(A2::Subcommand::NodeMgmt::Delete.new)
        add_command(A2::Subcommand::NodeMgmt::BulkDeleteById.new)
        add_command(A2::Subcommand::NodeMgmt::BulkDeleteByFilter.new)
        add_command(A2::Subcommand::NodeMgmt::Search.new)
      end
    end
  end
end
