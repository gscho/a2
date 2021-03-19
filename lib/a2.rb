require 'cmdparse'
require 'httparty'
require 'json'

require_relative 'a2/version'
require_relative 'a2/client'
require_relative 'a2/subcommand'
require_relative 'a2/command'
require_relative 'a2/parser'

module A2
  class Error < StandardError; end
end
