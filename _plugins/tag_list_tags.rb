module Jekyll
  class TagListTag < Liquid::Tag
    def render(context)
      html = ""
      tags = context.registers[:site].tags.keys
      tags.sort.each do |tag|
        posts_in_tag = context.registers[:site].tags[tag].size
        tag_dir = context.registers[:site].config['tag_dir']

        # [KT] Need to transform special tags. Instead of
        # duplicating logic, let's call GenerateTags.tag_dir.
        tag_url = GenerateTags.tag_dir(tag_dir, tag)
        # Make sure the tag URL begins with a slash.
        tag_url = "/#{tag_url}" unless tag_url =~ /^\//
        html << "<li><a href='#{tag_url}/'>#{tag} (#{posts_in_tag})</a></li>\n"
      end
      html
    end
  end
end

Liquid::Template.register_tag('tag_list', Jekyll::TagListTag)
