module Refinery
  module PageVideos
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery

      engine_name :refinery_page_videos

      def self.register(tab)
        tab.name = "videos"
        tab.partial = "/refinery/admin/pages/tabs/videos"
      end

      initializer "register refinery_page_videos plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "page_videos"
          plugin.hide_from_menu = true
        end
      end

      config.to_prepare do
        require 'refinerycms-pages'
        Refinery::Page.send :has_many_page_videos
        Refinery::Blog::Post.send :has_many_page_videos if defined?(::Refinery::Blog)
        Refinery::Videos::Video.module_eval do
          has_many :video_pages, :dependent => :destroy
        end
      end

      config.after_initialize do
        Refinery::Pages::Tab.register do |tab|
          register tab
        end

        if defined?(Refinery::Blog::Tab)
          Refinery::Blog::Tab.register do |tab|
            register tab
          end
        end

        Refinery.register_engine(Refinery::PageVideos)
      end
    end
  end
end