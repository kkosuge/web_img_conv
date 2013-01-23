require 'rack'

module WebImgConv
  class Server
    def initialize(options={})
      @image_converter = ImageConverter.new(options[:store_file_path])
    end

    def call(env)
      data = @image_converter.convert(env['PATH_INFO'])
      if data.is_a? Magick::Image
        [200, {"Content-Type" => data.mime_type}, [data.to_blob]]
      elsif production?
        [400, {"Content-Type" => 'text'}, ['Bad Request']]
      end
    rescue => e
      if production?
        [503, {"Content-Type" => 'text'}, [e.to_s]]
      end
    end

    def production?
      ENV['RACK_ENV'] == "production"
    end
  end
end
