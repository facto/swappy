require 'forwardable'

module Swappy
  module Commands
    class Command
      extend Forwardable

      attr_reader :options, :app_config_path

      def initialize(options={})
        @options         = options
        @app_config_path = options[:app_config_path]
      end

      protected

      def app_config
        @app_config ||= AppConfig.new(path: app_config_path)
      end
    end
  end
end
