FactoryGirl.define do
  factory :page_with_video, :parent => :page do
    after_create { |p| p.videos << Factory(:video) }
  end

  factory :blog_post_with_video, :parent => :blog_post do
    after_create { |b| b.videos << Factory(:video) }
  end if defined? Refinery::Blog::Post
end
