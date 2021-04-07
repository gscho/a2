module A2
  class Filtered < CmdParse::Command
    attr_reader :query_filter, :filter_key
    def initialize(name, opts = {})
      set_custom_opts!(opts)
      super(name, opts)
      set_filter_optparse_options!(options, @query_filter)
    end

    def set_custom_opts!(opts)
      @opt ||= {}
      @query_filter = opts.delete(:query_filter) || false
      @filter_key = opts.delete(:filter_key) || 'key'
    end

    def set_filter_optparse_options!(options, query_filter)
      options.on('-f', '--filters FILTERS', 'A comma-separated list of filters.') do |filters|
        @opt[:filters] = filters
      end
      if query_filter
        # Only available for query parameter filters
        options.on('-S', '--start-time START', 'Earliest most recent check-in node information to return. Formatted iso8601 (YYYY-MM-DD\'T\'HH:mm:ssZ)') do |start_time|
          @opt[:start] = start_time
        end
        options.on('-E', '--end-time END', 'Latest most recent check-in node information to return. Formatted iso8601 (YYYY-MM-DD\'T\'HH:mm:ssZ)') do |end_time|
          @opt[:end] = end_time
        end
      else
        # Only available for POST body filters
        options.on('-j', '--json-file FILE', 'Path to a json file containing a filter payload.') do |file|
          @opt[:json_file] = file
        end
      end
    end

    def parse_filters(filters)
      parsed_filters = []
      filters.split(',').each do |f|
        k,*v = f.split(':')
        parsed_filters << {
          @filter_key => k,
          'values' => [v.join(':')]
        }
      end
      parsed_filters
    end

    def generate_json_filters
      if @opt[:json_file]
        file_contents = File.read(@opt[:json_file])
        JSON.parse(file_contents).to_json
      elsif @opt[:filters]
        @opt[:filters] = parse_filters(@opt[:filters])
        @opt.to_json
      else
        command_parser.main_command.commands['help'].execute(*command_parser.current_command.command_chain.map(&:name))
        abort('Must provide one of either "--json-file" or "--filters"')
      end
    end

    def generate_query_filters
      query = []
      @opt[:filters].split(',').each do |filter|
        query << "filter=#{filter}"
      end if @opt[:filters]
      query << "start=#{@opt[:start]}" if @opt[:start]
      query << "end=#{@opt[:end]}" if @opt[:end]
      query_string = query.join('&')
      query_string.prepend('?')
    end

    def with_filter_query(&block)
      query_string = generate_query_filters
      yield(query_string)
    end
  end
end
