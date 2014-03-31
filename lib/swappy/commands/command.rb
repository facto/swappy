require 'forwardable'

module Swappy
  module Commands
    class Command
      extend Forwardable

      protected

      def app_config
        @app_config ||= AppConfig.new
      end
    end
  end
end
