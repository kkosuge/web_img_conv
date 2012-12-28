module WebImgConv
  class Parser
    class << self
      def parse(path)
        return [] unless path.match(/\/[\w]+\/[\d]+x[\d]+\/https?.+/)
        result = {
          path:   path,
          method: path.split('/')[1],
          size:   path.split('/')[2],
          image_url: path.split('/').drop(3).join('/')
        }

        result[:size].match(/([\d]+)x([\d]+)/) do |md|
          result[:width]  = md[1].to_i
          result[:height] = md[2].to_i
        end
        result
      end
    end
  end
end
