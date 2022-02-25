class PostsController < ApplicationController

# Create Post Route
post '/posts' do
    post = Post.create(
        content: params[:content],
        user_id: params[:user_id],
        club_id: params[:club_id]
    )
    post.to_json(include: :user)
end

# Read Posts Route
    get '/clubs/:id/posts' do
        posts = Post.where('club_id = ?', params[:id])
        posts.to_json(include: :user)
    end

    get '/posts/:id' do
        find_post
        @post.to_json(include: :user)
    end

private
    def find_post
        @post = Post.find_by_id(params[:id])
    end


end