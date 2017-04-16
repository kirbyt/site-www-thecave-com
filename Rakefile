
# This will be configured for you when you run config_deploy
deploy_branch  = "gh-pages"
git_repo = "git@github.com:kirbyt/site-www-thecave-com.git"

## -- Misc Configs -- ##

source_dir      = "."         # source file directory
deploy_dir      = "_deploy"   # deploy directory (for Github pages deployment)
site_dir        = "_site"     # Generated Jekyll site directory (for Github pages deployment)
drafts_dir      = "_drafts"   # directory for draft files
posts_dir       = "_posts"    # directory for blog files
new_post_ext    = "markdown"  # default new post file extension when using the new_post task

class String
  def titleize
    gsub(/\w+/) do |word|
      word.capitalize
    end
  end
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
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
    # post.puts "title: \"#{title.titleize.gsub(/&/,'&amp;')}\""
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M:%S %z')}"
    post.puts "category: "
    post.puts "tags: []"
    post.puts "---"
  end
  system "~/bin/subl --new-window . --add #{filename}"
end

# usage rake new_micro_post[my-new-post] or rake new_micro_post['my new post'] or rake new_micro_post (defaults to "new-post")
desc "Begin a new micro post in #{source_dir}/#{posts_dir}"
task :new_micro_post, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter a title for your micro post: ")
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
    post.puts "title: \"\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M:%S %z')}"
    post.puts "category: personal"
    post.puts "tags: [micropost]"
    post.puts "---"
  end
  system "~/bin/subl --new-window . --add #{filename}"
end

# usage rake draft[my-new-post] or rake draft['my new post'] or rake draft (defaults to "new-post")
desc "Begin a new post in #{source_dir}/#{drafts_dir}"
task :draft, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter a title for your post: ")
  end
  raise "### You haven't set anything up yet." unless File.directory?(source_dir)
  # mkdir_p "#{source_dir}/#{drafts_dir}"
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = "#{source_dir}/#{drafts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{slug}.#{new_post_ext}"
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
    post.puts "category: "
    post.puts "tags: []"
    post.puts "---"
  end
  system "~/bin/subl --new-window . --add #{filename}"
end

desc "Generate jekyll site"
task :generate do
  puts "## Generating Site with Jekyll"
  system "jekyll build"
end

desc "Generate and deploy jekyll site to Github Pages"
task :deploy do

  Rake::Task[:generate].execute

  puts "## Clone #{deploy_branch} branch from #{git_repo}"

  rm_rf "#{deploy_dir}"
  system "git clone --branch #{deploy_branch} #{git_repo} #{deploy_dir}"

  puts "## Copying #{site_dir} files to #{deploy_dir}"
  FileUtils.cp_r(site_dir + '/.', deploy_dir)

  cd "#{deploy_dir}" do
    system "git add ."
    message = "Site updated at #{Time.now.utc}"
    puts "\n## Committing: #{message}"
    system "git commit -m \"#{message}\""
    puts "\n## Pushing generated #{deploy_dir} website"
    system "git push origin #{deploy_branch}"
    puts "\n## Github Pages deploy complete"
  end
end

