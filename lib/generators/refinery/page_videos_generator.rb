module Refinery
  class PageVideosGenerator < Rails::Generators::Base

    source_root File.expand_path("../templates", __FILE__)

    def rake_db
      rake("refinery_page_videos:install:migrations")
    end

    def generate_page_videos_initializer
      template "config/initializers/refinery/page_videos.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "page_videos.rb")
    end

  end
end
