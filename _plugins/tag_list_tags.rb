module Jekyll
  class TagListTag < Liquid::Tag
    def render(context)
      html = ""
      tags = context.registers[:site].tags.keys
      tags.sort.each do |tag|
        posts_in_tag = context.registers[:site].tags[tag].size
        tag_dir = context.registers[:site].config['tag_dir']

        # [kt] Transform special tags.
        transformed_tag = tag
        if transformed_tag.casecmp(".net") == 0
          transformed_tag = "dotnet"
        end
        if transformed_tag.casecmp("c#") == 0
          transformed_tag = "csharp"
        end
        if transformed_tag.casecmp("c++") == 0
          transformed_tag = "cpp"
        end


        tag_url = File.join(tag_dir, transformed_tag.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase)
        html << "<li><a href='/#{tag_url}/'>#{tag} (#{posts_in_tag})</a></li>\n"
      end
      html
    end
  end
end

Liquid::Template.register_tag('tag_list', Jekyll::TagListTag)
