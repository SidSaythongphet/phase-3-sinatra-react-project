class PostsController < ApplicationController

# Create Post
    post '/posts' do
        post = Post.create(
            content: params[:content],
            user_id: params[:user_id],
            club_id: params[:club_id]
        )
        post.to_json(include: :user)
    end

# Read Posts Route
    # get posts for specific club & include user
    get '/clubs/:id/posts' do
        posts = Post.where('club_id = ?', params[:id])
        posts.to_json(include: :user)
    end
end