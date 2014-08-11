# Title: Enno's YouTube Tag for Jekyll
# Author: Enrico Schlag
# Description: Easily generate iframe code for embedding youtube videos.
#
# Syntax {% youtube id width height %}
#
# Example:
# {% youtube rrkrvAUbU9Y 1120 630 %}
#
# Output:
# <iframe width="1120" height="630" src="http://www.youtube.com/embed/rrkrvAUbU9Y" frameborder="0" allowfullscreen></iframe>
#

module Jekyll
  class YoutubeTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      if markup =~ /([^ ]+) (\d+) (\d+)( ([^ ]*))?/
        @video_id = $1
        @width    = $2
        @height   = $3
        @extra    = "?#{$5}" unless $5 == ''
      end
      super
    end

    def render(context)
      output = super
      if @video_id.size > 0
        '<iframe width="' + @width + '" height="' + @height + '" src="http://www.youtube.com/embed/' + @video_id + (@extra || '') + '" frameborder="0" allowfullscreen></iframe>'
      else
        'Some error occured while trying to render your Youtube video\'s code'
      end
    end
  end
end

Liquid::Template.register_tag('youtube', Jekyll::YoutubeTag)