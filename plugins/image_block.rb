module Jekyll
  module ImageBlockFilter
    def image_blockify(input)
      input.gsub(/^<p><img src="([^"]+\/)?content\/([^"]+)" alt="([^"]+)" \/><\/p>$/) do
        src   = "/images/content/#{$2}"
        title = $3
        
        "<figure class='image-block'>" +
          "<a href='#{src}' title='#{title}'>" +
            "<img src='#{src}' alt='#{title}' />" +
          "</a>" +
          "<figcaption class='image-caption'>#{title}</figcaption>" +
        "</figure>"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ImageBlockFilter)