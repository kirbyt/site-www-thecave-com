# require "rubygems"
# require "bundler/setup"
# require "stringex"

# This will be configured for you when you run config_deploy
deploy_branch  = "gh-pages"

## -- Misc Configs -- ##

# public_dir      = "public"    # compiled site directory
source_dir      = "."    # source file directory
# blog_index_dir  = 'source'    # directory for your blog's index page (if you put your index in source/blog/index.html, set this to 'source/blog')
# deploy_dir      = "_deploy"   # deploy directory (for Github pages deployment)
# stash_dir       = "_stash"    # directory to stash posts for speedy generation
posts_dir       = "_posts"    # directory for blog files
# themes_dir      = ".themes"   # directory for blog files
new_post_ext    = "markdown"  # default new post file extension when using the new_post task
# new_page_ext    = "markdown"  # default new page file extension when using the new_page task
# server_port     = "4000"      # port for preview server eg. localhost:4000

class String
  def titleize
    gsub(/\w+/) do |word|
      word.capitalize
    end
  end
end

# usage rake new_post[my-new-post] or rake new_post['my new post'] or rake new_post (defaults to "new-post")
desc "Begin a new post in #{source_dir}/#{posts_dir}"
task :new_post, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter a title for your post: ")
  end
  raise "### You haven't set anything up yet." unless File.directory?(source_dir)
  # mkdir_p "#{source_dir}/#{posts_dir}"
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = "#{source_dir}/#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{slug}.#{new_post_ext}"
  if File.exist?(filename)
    # abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
    abort("aborted! #{filename} already exists.")
  end
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.titleize.gsub(/&/,'&amp;')}\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M:%S %z')}"
    post.puts "categories: "
    post.puts "---"
  end
  system "~/bin/subl --new-window #{filename}"
end
