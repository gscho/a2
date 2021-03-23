require_relative '../subcommands/node'

module A2
  module Command
    class Node < CmdParse::Command
      def initialize
        super('node')
        short_desc('Node commands')
        long_desc('Node commands')
        add_command(A2::Subcommand::Node::Get.new)
        add_command(A2::Subcommand::Node::Delete.new)
        add_command(A2::Subcommand::Node::BulkDeleteById.new)
        add_command(A2::Subcommand::Node::BulkDeleteByFilter.new)
        add_command(A2::Subcommand::Node::Search.new)
      end
    end
  end
end
