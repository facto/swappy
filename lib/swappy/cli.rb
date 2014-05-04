require 'rubygems'
require 'swappy'
require 'trollop'

module Swappy
  class CLI
    attr_reader :cmd

    COMMANDS = %w(
      list
      swap
    )

    def initialize(args)
      Trollop::options do
        version VERSION_COPYRIGHT
        banner <<-EOS
#{APP_NAME} #{VERSION_COPYRIGHT}

Usage:
  #{APP_ID} [command]

  commands:
#{COMMANDS.map { |command| "    #{command}" }.join("\n") }
        EOS
        stop_on COMMANDS
      end

      @cmd = ARGV.shift
      case cmd
      when 'list'
      when 'swap'
        Trollop::die 'must provide a config set name' if ARGV.empty?
      else
        Trollop::die "unknown command"
      end
    end

    def run
      send(cmd)
    end

  protected

    def swap
      command = Swappy::Commands::Swap.new(name: config_set_name, app_config_path: app_config_path)
      command.call
    rescue Swappy::Commands::Swap::ConfigSetNotFoundError
      config_sets = Swappy::Commands::List.new.call.join(', ')
      Trollop::die "unknown config set #{config_set_name}; must be one of #{config_sets}"
    end

    def list
      command = Swappy::Commands::List.new(app_config_path: app_config_path)
      sets = command.call
      sets.each { |set| puts set }
    end

    def config_set_name
      @config_set_name ||= ARGV.shift
    end

    def app_config_path
      File.join(Dir.home, '.swappy.json')
    end
  end
end
