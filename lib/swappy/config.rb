module Swappy
  class Config
    attr_reader :json_data, :link_root, :source_root

    def initialize(json_data, link_root, source_root)
      @link_root = link_root
      @source_root = source_root
      @json_data = json_data
    end

    def link_file
      json_data[0]
    end

    def source_file
      json_data[1]
    end

    def link_path
      File.expand_path(File.join(link_root, link_file))
    end

    def source_path
      File.expand_path(File.join(source_root, source_file))
    end
  end
end
