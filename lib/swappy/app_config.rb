module Swappy
  class AppConfig
    include Enumerable

    attr_reader :options, :path

    def initialize(options={})
      @options = options
      @path = options[:path]
    end

    def config_sets
      @config_sets ||= json_config_sets.map { |config_set| ConfigSet.new(config_set) }
    end

    def each(&block)
      each_config_set(&block)
    end

    def each_config_set(&block)
      config_sets.each do |config_set|
        block.call(config_set)
      end
    end

    def find_config_set_by_name(name)
      config_sets.find { |set| set.name == name }
    end

    protected

    def app_config_content
      @app_config_content ||= File.read(File.expand_path(path))
    end

    def app_config_json_content
      @app_config_json_content ||= Oj.load(app_config_content)
    end

    def json_config_sets
      app_config_json_content['config_sets']
    end
  end
end
