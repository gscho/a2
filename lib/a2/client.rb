require_relative 'client/users'

require 'httparty'

module A2
  class Client
    include A2::Client::Users

    def initialize(opts = {})
      @automate_url = opts[:automate_url] || ENV['AUTOMATE_URL']
      @automate_token = opts[:automate_token] || ENV['AUTOMATE_TOKEN']
      @ssl_no_verify = opts[:ssl_no_verify] || false

      raise A2::Error, "Must provide the URL for Chef Automate" if @automate_url.nil?
      raise A2::Error, "Must provide a token for Chef Automate" if @automate_token.nil?
    end

    def get(path)
      response = HTTParty.get(File.join(@automate_url, path).to_s, {
        verify: !@ssl_no_verify,
        headers: {"api-token" => @automate_token},
      })
      puts response.body
    end

    def delete(path)
      response = HTTParty.delete(File.join(@automate_url, path).to_s, {
        verify: !@ssl_no_verify,
        headers: {"api-token" => @automate_token},
      })
      puts response.body
    end
  end
end
