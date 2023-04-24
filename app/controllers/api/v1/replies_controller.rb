module Api
    module V1
        class RepliesController < ApplicationController
            protect_from_forgery with: :null_session
            def index
                replies = Reply.all

                render json: ReplySerializer.new(replies).serialized_json
            end

            def show
                reply = Reply.find(params[:id])

                render json: ReplySerializer.new(reply).serialized_json
            end

            def create
                reply = Reply.new(reply_params)

                if reply.save
                    render json: ReplySerializer.new(reply).serialized_json
                else
                    render json: {error: reply.errors.messages}, status: 422
                end

            end

            private

            def reply_params 
                params.require(:reply).permit(:message, :user, :comment_id)
            end
            
        end
    end
    
end