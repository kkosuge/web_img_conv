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
      end
    end
  end
end
