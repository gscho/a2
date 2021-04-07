module A2
  module Subcommand
    module Reporting
      class ExportNodeReports < Paginated
        def initialize
          super('export-node-reports', takes_commands: false, filter_key: 'type')
          @opt[:type] = 'csv'
          options.on('-n', '--name NAME', 'Name of the profile (as defined in inspec.yml).') do |name|
            @opt[:name] = name
          end
          options.on('-O', '--owner OWNER', 'Automate user associated with the profile.') do |owner|
            @opt[:owner] = owner
          end
          options.on('-o', '--output OUTPUT_TYPE', 'Desired report data format (either "csv" or "json"). Default value is "csv".') do |output_type|
            @opt[:type] = output_type
          end
        end

        def execute(filename = nil, output_type = 'csv')
          # Workaround for bug: https://github.com/chef/automate/issues/4926
          @opt[:order] = @opt[:order].downcase.eql?('asc') ? 0 : 1
          with_paginated_filter_json do |json|
            filename ||= "report-#{Time.now.strftime('%Y%m%d%H%M%S')}.#{@opt[:type]}"
            response = A2::Client.new(command_parser.data).export_node_reports(json, filename)
          end
        end
      end
    end
  end
end
