# Based on the plugin found at: 
# https://gist.github.com/joelverhagen/1805814
#
# Example use:
#
# Easily embed a Vimeo video. Just drop this file in your _plugins directory.
#
# {% vimeo oHg5SJYRHA0 %}
# You can also specify a height and width. If you do not, it defaults to 500 x 281.
#
# {% vimeo oHg5SJYRHA0 500 400 %}
#

class Vimeo < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/
 
  def initialize(tagName, markup, tokens)
    super
 
    if markup =~ Syntax then
      @id = $1
 
      if $2.nil? then
          @width = 500
          @height = 281
      else
          @width = $2.to_i
          @height = $3.to_i
      end
    else
      raise "No Vimeo ID provided in the \"vimeo\" tag"
    end
  end
 
  def render(context)
    "<div class=\"vimeo-video\"><figure><iframe src=\"//player.vimeo.com/video/#{@id}\" width=\"#{@width}\" height=\"#{@height}\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></figure></div>"
  end
 
  Liquid::Template.register_tag "vimeo", self
end

