module Swappy
  module Commands
    class Swap < Command
      ConfigSetNotFoundError = Class.new(StandardError)

      attr_reader :name

      def_delegators :config_set, :link_root, :source_root, :configs

      def initialize(name)
        @name = name
        raise ConfigSetNotFoundError unless config_set
      end

      def call
        puts "Switching to config set #{config_set.name}..."
        config_set.each do |config|
          link_path = config.link_path
          existing_symlink_target = nil
          backup = nil
          if File.symlink?(link_path)
            existing_symlink_target = File.readlink(link_path)
            File.unlink(link_path)
          elsif File.exists?(link_path)
            backup = backup_path(link_path)
            puts "backing up #{link_path} to #{backup}"
            File.rename(link_path, backup)
          end
          begin
            puts "linking #{link_path} to #{config.source_path}"
            File.symlink(config.source_path, link_path)
          rescue => e
            if existing_symlink_target
              File.symlink(existing_symlink_target, link_path)
            end
            raise e
          end
        end
      end

      private

      def config_set
        app_config.find_config_set_by_name(name)
      end

      def backup_path(link_path)
        timestamp = Time.now.to_i.to_s
        new_basename = "#{File.basename(link_path)}.backup.#{timestamp}"
        Pathname.new(File.join(File.dirname(link_path), new_basename))
      end
    end
  end
end
