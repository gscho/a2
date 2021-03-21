require_relative '../subcommands/managed_node'

module A2
  module Command
    class NodeMgmt < CmdParse::Command
      def initialize
        super('nodemgmt')
        short_desc('Node manangement commands')
        long_desc('Node manangement commands')
        add_command(A2::Subcommand::ManagedNode::Get.new)
        add_command(A2::Subcommand::ManagedNode::Delete.new)
        add_command(A2::Subcommand::ManagedNode::BulkDeleteById.new)
        add_command(A2::Subcommand::ManagedNode::BulkDeleteByFilter.new)
        add_command(A2::Subcommand::ManagedNode::Search.new)
      end
    end
  end
end
