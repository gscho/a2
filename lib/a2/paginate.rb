module A2
  module Subcommand
    module Paginate
      def initialize(name, opts = {})
        super(name, takes_commands: false)
        @opt = {
          order: 'ASC'
        }
        options.on('-o', '--order ORDER', 'Return the results in ascending or descending order. Default is "ASC".') do |order|
          @opt[:order] = order
        end
        options.on('-p', '--page PAGE', Integer, 'Starting page for the results.') do |page|
          @opt[:page] = page
        end
        options.on('-P', '--per-page PER_PAGE', Integer, 'The number of results on each page.') do |per_page|
          @opt[:per_page] = per_page
        end
        options.on('-s', '--sort SORT', 'Sort the results on a specific field.') do |sort|
          @opt[:sort] = sort
        end
        options.on('-j', '--json-file FILE', 'Path to a json file containing a filter payload.') do |file|
          @opt[:json_file] = file
        end
        options.on('-f', '--filters FILTERS', 'A comma-separated list of filters.') do |filters|
          @opt[:filters] = parse_filters(filters)
        end
      end

      def parse_filters(filters)
        parsed_filters = []
        filters.split(',').each do |f|
          k,v = f.split(':')
          parsed_filters << {
            'key' => k,
            'values' => [v]
          }
        end
        parsed_filters
      end

      def generate_request_json
        if @opt[:json_file]
          file_contents = File.read(@opt[:json_file])
          JSON.parse(file_contents).to_json
        elsif @opt[:filters]
          @opt.to_json
        else
          command_parser.main_command.commands['help'].execute(*command_parser.current_command.command_chain.map(&:name))
          abort('Must provide one of either "--json-file" or "--filters"')
        end
      end

      def with_filter_json(&block)
        json = generate_request_json
        yield(json)
      end
    end
  end
end
