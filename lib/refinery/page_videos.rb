require 'refinerycms-core'

module Refinery
  autoload :PageVideosGenerator, 'generators/refinery/page_videos_generator'

  module PageVideos

    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end

    require 'refinery/page_videos/configuration'
    require 'refinery/page_videos/engine'
    require 'refinery/page_videos/extension'
  end
end
