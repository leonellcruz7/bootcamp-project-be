module Api
    module V1
        class PostsController < ApplicationController
            protect_from_forgery with: :null_session
            def index
                posts = Post.all

                render json: PostSerializer.new(posts, data).serialized_json
            end

            def show
                post = Post.find(params[:id])

                render json: PostSerializer.new(post, data).serialized_json
            end

            def search
                data = JSON.parse(request.body.read)
                query = data['title']
                post = Post.where("lower(downcase_title) LIKE ?", "%#{query}%")

                render json: PostSerializer.new(post, data).serialized_json
            end

            def create
                post = Post.new(post_params)
                post.tags = params[:post][:tags] 
                if post.save
                   render json: PostSerializer.new(post).serialized_json 
                else
                    render json: {error: post.errors.messages}, status: 422
                end
            end

            def destroy
               post = Post.find(params[:id]) 


               if post.destroy
                render json: PostSerializer.new(post)
               else
                render json: {error: post.errors.messages}, status: 422
               end
            end

            def update
                post = Post.find(params[:id])
                post.tags = params[:post][:tags] 
                if post.update(post_params)
                    render json: PostSerializer.new(post).serialized_json
                else
                    render json: {error: post.errors.messages}, status: 422
                end
            end

            def upvote
                post = Post.find(params[:id])
                post.votes += 1
                post.save
                render json: PostSerializer.new(post).serialized_json
            end

            def downvote
                post = Post.find(params[:id])
                    post.votes -= 1
                    if post.votes > 0 
                        post.save
                    end
                render json: PostSerializer.new(post).serialized_json
            end
            
            private

            def post_params
                params.require(:post).permit(:title,:body,:user_id, :tags)
            end

            def data
                @user ||= {include: %i[user]}
                @comments ||= {include: %i[comments]}
            end

            
        end
        
    end
    
end