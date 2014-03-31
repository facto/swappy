module Swappy
  class LinkSet
    include Enumerable

    attr_reader :json_data

    def initialize(json_data)
      @json_data = json_data
    end

    def each(&block)
      links.each do |link|
        block.call(link)
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

    def links
      @links ||= properties['links'].map { |link| Link.new(link) }
    end

    protected

    def properties
      json_data[1]
    end
  end
end
