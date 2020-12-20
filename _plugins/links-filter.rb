module Jekyll
  class LinksHelper

  	# Processes the given dir and removes leading and trailing slashes. Falls
    # back on the default if no dir is provided.
    def self.join_path(base_dir, path)
      base_dir = base_dir.gsub(/^\/*(.*)\/*$/, '\1')
      path = path.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase
      File.join(base_dir, path)
    end

  end

  module LinksFilter

    # Outputs a list of categories as comma-separated <a> links. This is used
    # to output the category list for each post on a category page.
    #
    #  +categories+ is the list of categories to format.
    #
    # Returns string
    def category_links(categories)
      base_dir = @context.registers[:site].config['category_dir']
      categories = categories.sort!.map do |category|
        category_dir = LinksHelper.join_path(base_dir, category)
        # Make sure the category directory begins with a slash.
        category_dir = "/#{category_dir}" unless category_dir =~ /^\//
        "<a class='category' href='#{category_dir}/'>#{category}</a>"
      end

      case categories.length
      when 0
        ""
      when 1
        categories[0].to_s
      else
        categories.join(', ')
      end
    end

    # Outputs a list of tags as comma-separated <a> links. This is used
    # to output the tag list for each post on a tag page.
    #
    #  +tags+ is the list of tags to format.
    #
    # Returns string
    def tag_links(tags)
      base_dir = @context.registers[:site].config['tag_dir']
      tags = tags.sort!.map do |tag|
        tag_dir = LinksHelper.join_path(base_dir, tag)
        # Make sure the tag directory begins with a slash.
        tag_dir = "/#{tag_dir}" unless tag_dir =~ /^\//
        "<a class='tag' href='#{tag_dir}/'>#{tag}</a>"
      end

      case tags.length
      when 0
        ""
      when 1
        tags[0].to_s
      else
        tags.join(', ')
      end
    end

  end
end

Liquid::Template.register_filter(Jekyll::LinksFilter)