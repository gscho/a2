require_relative 'client/managed_nodes'
require_relative 'client/teams'
require_relative 'client/users'

module A2
  class Client
    include A2::Client::ManagedNodes
    include A2::Client::Teams
    include A2::Client::Users

    def initialize(opts = {})
      @automate_url = opts[:automate_url] || ENV['AUTOMATE_URL']
      @automate_token = opts[:automate_token] || ENV['AUTOMATE_TOKEN']
      @ssl_no_verify = opts[:ssl_no_verify] || ENV['AUTOMATE_SSL_NO_VERIFY'] || false

      raise A2::Error, "Must provide the URL for Chef Automate" if @automate_url.nil?
      raise A2::Error, "Must provide a token for Chef Automate" if @automate_token.nil?
    end

    def get(path)
      response = HTTParty.get(File.join(@automate_url, path).to_s, {
        verify: !@ssl_no_verify,
        headers: {"api-token" => @automate_token},
      })
      puts JSON.pretty_generate(JSON.parse(response.body))
    end

    def put(path, json)
      response = HTTParty.put(File.join(@automate_url, path).to_s, {
        verify: !@ssl_no_verify,
        headers: {"api-token" => @automate_token},
        body: json
      })
      puts JSON.pretty_generate(JSON.parse(response.body))
    end

    def post(path, json)
      response = HTTParty.post(File.join(@automate_url, path).to_s, {
        verify: !@ssl_no_verify,
        headers: {"api-token" => @automate_token},
        body: json
      })
      puts JSON.pretty_generate(JSON.parse(response.body))
    end

    def delete(path)
      response = HTTParty.delete(File.join(@automate_url, path).to_s, {
        verify: !@ssl_no_verify,
        headers: {"api-token" => @automate_token},
      })
      puts JSON.pretty_generate(JSON.parse(response.body))
    end
  end
end
