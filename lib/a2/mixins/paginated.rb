module A2
  class Paginated < Filtered
    def initialize(name, opts = {})
      super(name, opts)
      @opt[:order] = 'ASC'
      options.on('-o', '--order ORDER', 'Return the results in ascending or descending order. Default is "ASC".') do |order|
        @opt[:order] = order
      end
      options.on('-p', '--page PAGE', Integer, 'Starting page for the results. Default is 0') do |page|
        @opt[:page] = page
      end
      options.on('-P', '--per-page PER_PAGE', Integer, 'The number of results on each page. Default is 100') do |per_page|
        @opt[:per_page] = per_page
      end
      options.on('-s', '--sort SORT', 'Sort the results on a specific field.') do |sort|
        @opt[:sort] = sort
      end
      set_filter_optparse_options!(options)
    end

    def with_paginated_filter_json(&block)
      json = generate_json_filters
      yield(json)
    end

    def generate_paginated_query_string
      query = generate_query_filters
      query << "&pagination.page=#{@opt[:page]}" if @opt[:page]
      query << "&pagination.page=#{@opt[:per_page]}" if @opt[:per_page]
      query << "&sorting.field=#{@opt[:sort]}" if @opt[:sort]
      query << "&sorting.order=#{@opt[:order]}" if @opt[:order]
      query
    end

    def with_paginated_filter_query(&block)
      query_string = generate_paginated_query_string
      yield(query_string)
    end
  end
end
