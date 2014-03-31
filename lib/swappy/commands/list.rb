module Swappy
  module Commands
    class List < Command
      def call
        app_config.map do |config_set|
          config_set.name
        end
      end
    end
  end
end
