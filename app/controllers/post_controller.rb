class PostController < ApplicationController

  def index

  end

  def json
    render json: Post.all
  end

  def new
    p params
    post = Post.new(:author => params["author"],:body => params["body"])
    p post
    post.save!

  end
end
