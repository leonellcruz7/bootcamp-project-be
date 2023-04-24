module Api
    module V1
        class CommentsController < ApplicationController
            protect_from_forgery with: :null_session

            def index
                comments = Comment.all 
 
                render json: CommentSerializer.new(comments, post).serialized_json
             end

             def show
                comment = Comment.find(params[:id]) 
 
                render json: CommentSerializer.new(comment, post).serialized_json
             end

            def create
                comment = Comment.new(comment_params)

                if comment.save
                    render json: CommentSerializer.new(comment).serialized_json
                else
                    render json: {error: comment.errors.messages}, status: 422
                end
            end

            def destroy
                comment = Comment.find(params[:id])

                if comment.destroy
                    render json: CommentSerializer.new(comment).serialized_json
                else
                    render json: {error: comment.errors.messages}, status: 422
                end
            end

            def upvote

                comment = Comment.find(params[:id])
                data = JSON.parse(request.body.read)
                userid = data['user_id']
                comment.votes << userid unless comment.votes.include?(userid)
                comment.save
                render json: CommentSerializer.new(comment).serialized_json

                
            end
            def downvote

                comment = Comment.find(params[:id])
                data = JSON.parse(request.body.read)
                userid = data['user_id']
                comment.votes.delete(userid)
                comment.save
                render json: CommentSerializer.new(comment).serialized_json

                
            end

            private



            def comment_params
                params.require(:comment).permit(:message, :post_id, :username)
            end

            
            def post
                @post ||= {include: %i[post]}
                @replies ||= {include: %i[replies]}
            end


        end
        
    end
    
end