module Refinery
  module PageVideos
    include ActiveSupport::Configurable

    config_accessor :captions

    self.captions = false
  end
end
