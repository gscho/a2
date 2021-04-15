module A2
  class Client
    module Reporting
      def export_node_reports(json, output_file)
        download_file '/api/v0/compliance/reporting/node/export', json, output_file
      end

      def list_reports(json)
        post '/api/v0/compliance/reporting/reports', json
      end
    end
  end
end
