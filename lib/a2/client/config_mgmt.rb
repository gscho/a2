module A2
  class Client
    module ConfigMgmt
      def list_all_checked_in_nodes(query_string = '')
        get "/api/v0/cfgmgmt/nodes#{query_string}"
      end

      def list_all_missing_nodes_count(query_string = '?durations=3d&durations=1w&durations=2w&durations=1M&durations=3M')
        get "/api/v0/cfgmgmt/stats/missing_node_duration_counts#{query_string}"
      end

      def list_all_node_status_counts(query_string = '')
        get "/api/v0/cfgmgmt/stats/node_counts#{query_string}"
      end

      def list_all_organizations
        get '/api/v0/cfgmgmt/organizations'
      end

      def show_attributes(node_id)
        get "/api/v0/cfgmgmt/nodes/#{node_id}/attribute"
      end
    end
  end
end
