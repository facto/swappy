module Swappy
  class ConfigSet
    include Enumerable

    attr_reader :json_data

    def initialize(json_data)
      @json_data = json_data
    end

    def each(&block)
      configs.each do |config|
        block.call(config)
      end
    end

    def name
      json_data[0]
    end

    def link_root
      properties['link_root']
    end

    def source_root
      properties['source_root']
    end

    def configs
      @configs ||= properties['configs'].map { |config| Config.new(config, link_root, source_root) }
    end

    protected

    def properties
      json_data[1]
    end
  end
end
