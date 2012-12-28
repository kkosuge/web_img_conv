# coding: utf-8
require 'open-uri'
require 'base64'

module WebImgConv
  class ImageConverter

    VALID_CONVERT_METHODS = %w[
      resize
      resize_to_fill
    ].freeze

    def initialize(store_file_path=nil)
      @store_file_path = store_file_path
    end

    def convert(path)
      @path = path
      Parser.parse(path).each { |k,v| instance_variable_set("@#{k}",v) }
      execute
    end

    def resize
      write_read rmagick_image.resize(@width,@height)
    end

    def resize_to_fill
      write_read rmagick_image.resize_to_fit(@width,@height)
    end

    private
    def encoded_file_name
      Base64.strict_encode64(@path)
    end

    def encoded_file_path
      @store_file_path[-1] == "/" ?
        "#{@store_file_path}#{Base64.strict_encode64(@path)}" :
        "#{@store_file_path}/#{Base64.strict_encode64(@path)}"
    end

    def store_file?
      @store_file_path
    end

    def file_exist?
      if store_file?
        File.exist? encoded_file_path
      else
        false
      end
    end

    def rmagick_image
      Magick::Image.from_blob(get_image).first
    end

    def rmagick_image_from_cache
      Magick::Image.read(encoded_file_path).first
    end

    def write_read(image)
      image.write encoded_file_path if store_file?
      return image
    end

    def get_image
      open(@image_url).read
    end

    def execute
      return nil unless @image_url

      if file_exist?
        return rmagick_image_from_cache
      end

      if VALID_CONVERT_METHODS.include? @method
        send @method
      else
        raise NoMethodError, "undefined convert method `#{@method}`"
      end
    end
  end
end
