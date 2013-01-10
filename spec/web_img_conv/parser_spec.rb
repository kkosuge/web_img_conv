# coding: utf-8

require "spec_helper"

describe WebImgConv::Parser do
  describe "resize" do
    url = "/resize/350x200/https://gist.github.com/raw/4467877/onomichi.jpg"
    subject{ WebImgConv::Parser.parse(url) }

    its([:method]){ should eq 'resize' }
    its([:width]){  should eq 350 }
    its([:height]){ should eq 200 }
    its([:image_url]){ should eq 'https://gist.github.com/raw/4467877/onomichi.jpg' }
  end

  describe "resize" do
    url = "/resize_to_fill/350x200/https://gist.github.com/raw/4467877/onomichi.jpg"
    subject{ WebImgConv::Parser.parse(url) }

    its([:method]){ should eq 'resize_to_fill' }
    its([:width]){  should eq 350 }
    its([:height]){ should eq 200 }
    its([:image_url]){ should eq 'https://gist.github.com/raw/4467877/onomichi.jpg' }
  end
end
