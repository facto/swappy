require 'pathname'
require 'oj'

require 'swappy/version'

module Swappy
  APP_ID = 'swappy'
  APP_NAME = 'Swappy'
  VERSION_COPYRIGHT = "v#{VERSION} \u00A9 #{Time.now.year}"

  autoload :Config, 'swappy/config'
  autoload :ConfigSet, 'swappy/config_set'
  autoload :AppConfig, 'swappy/app_config'

  module Commands
    autoload :Command, 'swappy/commands/command'
    autoload :List, 'swappy/commands/list'
    autoload :Swap, 'swappy/commands/swap'
  end
end
