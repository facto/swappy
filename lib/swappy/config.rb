module Swappy
  class Config
    include Enumerable

    attr_reader :path

    def initialize(path=File.join(Dir.home, '.swappy.json'))
      @path = path
    end

    def link_sets
      @link_sets ||= config_json_content['link_sets'].map { |link_set| LinkSet.new(link_set) }
    end

    def each(&block)
      link_sets.each do |link_set|
        block.call(link_set)
      end
    end

    protected

    def config_content
      @config_content ||= File.read(File.expand_path(path))
    end

    def config_json_content
      @config_json_content ||= Oj.load(config_content)
    end
  end
end
