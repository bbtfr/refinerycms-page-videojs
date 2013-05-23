# Page Videojs Engine for Refinery CMS

## About

Page Videojs allows you to relate one or more videos to any page in Refinery which makes it really easy for you to create simple video galleries with lightbox style popups on the front end page views.

(And a shameless ripoff of refinerycms-page-images. :)

**It's just tested for refinery 2.0.**

## Requirements

* refinerycms >= 2.0.0
* refinerycms-videojs >= 0.5.5.1

## Features

* Ability to select one or more videos from the video picker and relate them to a page
* Reordering support, simply drag into order
* Optionally include captions with each video.

## Install

Add this line to your applications `Gemfile`

```ruby
gem 'refinerycms-page-videojs', github: 'bbtfr/refinerycms-page-videojs'
```

Next run

```bash
bundle install
rails generate refinery:page_videos
rake db:migrate
```

Now when you start up your Refinery application, edit a page and there should be a new "Videos" tab.

## Enable Captions

You can enable captions using an initializer containing the following configuration:

```ruby
Refinery::PageVideos.captions = true
```

## Usage

`app/views/refinery/pages/show.html.erb`

```erb
<% content_for :body_content_right do %>
  <ul id='gallery'>
    <% @page.videos.each do |video| %>
      <li>
        <%= video.to_html %>
      </li>
   <% end %>
  </ul>
<% end %>
<%= render :partial => "/refinery/content_page" %>
```
