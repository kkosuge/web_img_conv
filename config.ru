require 'bundler'
Bundler.require
require 'pathname'
base_dir = Pathname.new(__FILE__).dirname.cleanpath.realpath
$LOAD_PATH.unshift((base_dir + "lib").to_s)
require 'yaml'
require 'web_img_conv'

config = YAML.load(File.open((base_dir + "config/config.yml").to_s))

store_file_path = config["store_file_path"]
unless File.exists?(store_file_path)
  store_file_path = nil
  puts "----------------------"
  puts "- Disable File Cache -"
  puts "----------------------"
else
  puts "Store File Path: #{store_file_path}"
end

run WebImgConv::Server.new({
  store_file_path: store_file_path
})
