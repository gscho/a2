require_relative '../subcommands/reporting'

module A2
  module Command
    class Compliance < CmdParse::Command
      def initialize
        super('compliance')
        short_desc('Compliance management commands')
        long_desc('Compliance management commands')
        add_command(A2::Subcommand::Reporting::ExportNodeReports.new)
        add_command(A2::Subcommand::Reporting::ListReports.new)
      end
    end
  end
end
