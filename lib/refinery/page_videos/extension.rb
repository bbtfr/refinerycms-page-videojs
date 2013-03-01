module Refinery
  module PageVideos
    module Extension
      def has_many_page_videos
        has_many :video_pages, :as => :page, :order => 'position ASC'
        has_many :videos, :class_name => 'Refinery::Videos::Video', :through => :video_pages, :order => 'position ASC'
        # accepts_nested_attributes_for MUST come before def videos_attributes=
        # this is because videos_attributes= overrides accepts_nested_attributes_for.

        accepts_nested_attributes_for :videos, :allow_destroy => false

        # need to do it this way because of the way accepts_nested_attributes_for
        # deletes an already defined videos_attributes
        module_eval do
          def videos_attributes=(data)
            ids_to_keep = data.map{|i, d| d['video_page_id']}.compact

            video_pages_to_delete = if ids_to_keep.empty?
              self.video_pages
            else
              self.video_pages.where(
                Refinery::VideoPage.arel_table[:id].not_in(ids_to_keep)
              )
            end

            video_pages_to_delete.destroy_all

            data.each do |i, video_data|
              video_page_id, video_id, caption =
                video_data.values_at('video_page_id', 'id', 'caption')

              next if video_id.blank?

              video_page = if video_page_id.present?
                self.video_pages.find(video_page_id)
              else
                self.video_pages.build(:video_id => video_id)
              end

              video_page.position = i
              video_page.caption = caption if Refinery::PageVideos.captions
              video_page.save
            end
          end
        end

        include Refinery::PageVideos::Extension::InstanceMethods

        attr_accessible :videos_attributes
      end

      module InstanceMethods

        def caption_for_video_index(index)
          self.video_pages[index].try(:caption).presence || ""
        end

        def video_page_id_for_video_index(index)
          self.video_pages[index].try(:id)
        end
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Refinery::PageVideos::Extension)
