require 'spec_helper'

module Refinery
  describe BlogPost do
    it "should not have videos" do
      blog = Factory(:blog_post)
      blog.videos.count.should == 0
    end

    it "should have videos" do
      blog = Factory(:blog_post_with_video)
      blog.videos.count.should == 1
    end
  end 
end if defined?(Refinery::Blog::Post)
