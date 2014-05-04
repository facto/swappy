require 'forwardable'

module Swappy
  module Commands
    class Command
      extend Forwardable

      attr_reader :options

      def initialize(options={})
        @options = options
      end

      protected

      def app_config
        @app_config ||= AppConfig.new
      end
    end
  end
end
