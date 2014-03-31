require 'rubygems'
require 'swappy'
require 'trollop'

module Swappy
  class Cli
    attr_reader :cmd

    COMMANDS = %w(
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
      end

      @cmd = ARGV.shift || ''
    end

    def run
      send(cmd)
    end

  protected

    def swap
      swapper = Swapper.new
      swapper.swap(name)
    end

    def name
      @name ||= ARGV.shift
    end
  end
end
