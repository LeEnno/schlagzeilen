module Jekyll
  module ImageBlockFilter
    def image_blockify(input)
      input.gsub(/^<p><img src="([^"]+\/)?([^"]+)" alt="([^"]+)" \/><\/p>$/) do
        "<p class='image-block'><img src='/images/content/#{$2}' alt='#{$3}' /></p>"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ImageBlockFilter)