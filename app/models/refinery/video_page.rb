module Refinery
  class VideoPage < Refinery::Core::BaseModel

    belongs_to :video
    belongs_to :page, :polymorphic => true

    translates :caption if self.respond_to?(:translates)

    attr_accessible :video_id, :position, :locale
    self.translation_class.send :attr_accessible, :locale

  end
end
