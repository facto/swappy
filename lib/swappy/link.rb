module Swappy
  class Link
    attr_reader :json_data

    def initialize(json_data)
      @json_data = json_data
    end

    def link_path
      json_data[0]
    end

    def source_path
      json_data[1]
    end
  end
end
