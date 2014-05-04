module Swappy
  module Commands
    class Swap < Command
      ConfigSetNotFoundError = Class.new(StandardError)

      attr_reader :name

      def_delegators :config_set, :link_root, :source_root, :configs

      def initialize(options={})
        super options
        @name = options[:name]
        raise ConfigSetNotFoundError unless config_set
      end

      def call
        switch_to_config_set
      end

      private

      def switch_to_config_set
        puts "Switching to config set #{config_set.name}..."
        config_set.each do |config|
          backup(config.link_path)
          link(config.source_path, config.link_path)
        end
        puts "Done!"
      end

      def backup(link_path)
        if File.exists?(link_path)
          backup_path = backup_path(link_path)
          puts "backing up #{File.symlink?(link_path) ? 'symlink ' : ' '}#{link_path} to #{backup_path}"
          File.rename(link_path, backup_path)
        end
      end

      def link(source_path, link_path)
        puts "linking #{link_path} to #{source_path}"
        File.symlink(source_path, link_path)
      end

      def config_set
        @config_set ||= app_config.find_config_set_by_name(name)
      end

      def backup_path(link_path)
        timestamp = Time.now.to_i.to_s
        new_basename = "#{File.basename(link_path)}.backup.#{timestamp}"
        Pathname.new(File.join(File.dirname(link_path), new_basename))
      end
    end
  end
end
