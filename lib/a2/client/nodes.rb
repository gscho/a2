module A2
  class Client
    module Nodes
      def get_managed_node(id)
        get "/api/v0/nodes/id/#{id}"
      end

      def delete_managed_node(id)
        delete "/api/v0/nodes/id/#{id}"
      end

      def search_managed_nodes(json)
        post 'api/v0/nodes/search', json
      end

      def bulk_delete_managed_nodes_by_id(json)
        post '/api/v0/nodes/delete/ids', json
      end

      def bulk_delete_managed_nodes_by_filter(json)
        post '/api/v0/nodes/delete', json
      end
    end
  end
end
