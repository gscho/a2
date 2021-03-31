module A2
  class Client
    module Reporting
      def export_node_reports(json, output_file)
        download_report '/api/v0/compliance/reporting/node/export', json, output_file
      end
    end
  end
end
