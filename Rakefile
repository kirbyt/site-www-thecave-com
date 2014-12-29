
# This will be configured for you when you run config_deploy
deploy_branch  = "gh-pages"
git_repo = "https://github.com/kirbyt/site-www-thecave-com.git"

## -- Misc Configs -- ##

source_dir      = "."         # source file directory
deploy_dir      = "_deploy"   # deploy directory (for Github pages deployment)
site_dir        = "_site"     # Generated Jekyll site directory (for Github pages deployment)
posts_dir       = "_posts"    # directory for blog files
new_post_ext    = "markdown"  # default new post file extension when using the new_post task

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

desc "Generate jekyll site"
task :generate do
  puts "## Generating Site with Jekyll"
  system "jekyll build"
end

desc "Generate and deploy jekyll site to Github Pages"
task :deploy do

  Rake::Task[:generate].execute

  puts "## Fetch git repo at #{git_repo}"
  FileUtils.mkdir_p(deploy_dir) unless File.exist?(deploy_dir)
  cd "#{deploy_dir}" do 
    if not File.exist?(deploy_branch)
      system "git clone #{git_repo} #{deploy_branch}"
      cd "#{deploy_branch}" do 
        system "git branch #{deploy_branch} origin/#{deploy_branch}"
      end
    end
  end

  cd "#{deploy_dir}/#{deploy_branch}" do
    system "git checkout #{deploy_branch}"
    system "git pull"
  end

  # Remove the old files and directories
  (Dir["#{deploy_dir}/#{deploy_branch}/*"]).each { |f| rm_rf(f) }  

  puts "## Copying #{site_dir} files to #{deploy_dir}/#{deploy_branch}"
  FileUtils.cp_r(site_dir + '/.', deploy_dir + '/' + deploy_branch)

  cd "#{deploy_dir}/#{deploy_branch}" do 
    system "git add -A ."
    message = "Site updated at #{Time.now.utc}"
    puts "\n## Committing: #{message}"
    system "git commit -m \"#{message}\""
    puts "\n## Pushing generated #{deploy_dir} website"
    system "git push origin #{deploy_branch}"
    puts "\n## Github Pages deploy complete"
  end

end

