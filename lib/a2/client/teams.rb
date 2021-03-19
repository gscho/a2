module A2
  class Client
    module Teams
      def list_all_teams
        get '/apis/iam/v2/teams'
      end

      def get_team(id)
        get "/apis/iam/v2/teams/#{id}"
      end

      def create_team(json)
        post '/apis/iam/v2/teams', json
      end

      def update_team(id, json)
        put "/apis/iam/v2/teams/#{id}", json
      end

      def delete_team(id)
        delete "/apis/iam/v2/teams/#{id}"
      end

      def list_all_membership(team_id)
        get "/apis/iam/v2/teams/#{team_id}/users"
      end

      def get_teams_by_membership(membership_id)
        get "/apis/iam/v2/users/#{membership_id}/teams"
      end

      def add_membership(id)
        post "/apis/iam/v2/teams/#{id}/users:add", json
      end

      def remove_membership(id, json)
        post "/apis/iam/v2/teams/#{id}/users:remove", json
      end
    end
  end
end
