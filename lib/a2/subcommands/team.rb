module A2
  module Subcommand
    module Team
      def self.generate_team_json(id, name, project_ids)
        {
          'id' => id,
          'name' => name,
          'projects' => project_ids.split(',')
        }.to_json
      end
      class ListAll < CmdParse::Command
        def initialize
          super('list-teams', takes_commands: false)
        end

        def execute
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).list_all_teams)
        end
      end
      class Create < CmdParse::Command
        def initialize
          super('create-team', takes_commands: false)
        end

        def execute(id, name, project_ids = '')
          json = Team.generate_team_json(id, name, project_ids)
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).create_team(json))
        end
      end
      class Get < CmdParse::Command
        def initialize
          super('get-team', takes_commands: false)
        end

        def execute(id)
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).get_team(id))
        end
      end
      class Update < CmdParse::Command
        def initialize
          super('update-team', takes_commands: false)
        end

        def execute(id, name, project_ids = '')
          json = Team.generate_team_json(id, name, project_ids)
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).update_team(id, json))
        end
      end
      class Delete < CmdParse::Command
        include A2::Approved
        def initialize
          super('delete-team', takes_commands: false)
        end

        def execute(id)
          with_approval("delete team #{id}") do
            puts JSON.pretty_generate(A2::Client.new(command_parser.data).delete_team(id))
          end
        end
      end
      class ListAllMembership < CmdParse::Command
        def initialize
          super('list-team-members', takes_commands: false)
        end

        def execute(team_id)
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).list_all_membership(team_id))
        end
      end
      class AddMembership < CmdParse::Command
        def initialize
          super('add-membership', takes_commands: false)
        end

        def execute

        end
      end
      class GetTeamsByMembership < CmdParse::Command
        def initialize
          super('get-teams-by-membership', takes_commands: false)
        end

        def execute(membership_id)
          puts JSON.pretty_generate(A2::Client.new(command_parser.data).get_teams_by_membership(membership_id))
        end
      end
      class RemoveMembership < CmdParse::Command
        def initialize
          super('remove-membership', takes_commands: false)
        end

        def execute

        end
      end
    end
  end
end
