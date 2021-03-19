module A2
  class Client
    module Users
      def list_all_users
        get '/apis/iam/v2/users'
      end

      def get_user(id)
        get "/apis/iam/v2/users/#{id}"
      end

      def create_user(json)
        post '/apis/iam/v2/users', json
      end

      def update_user(id, json)
        put "/apis/iam/v2/users/#{id}", json
      end

      def delete_user(id)
        delete "/apis/iam/v2/users/#{id}"
      end
    end
  end
end
