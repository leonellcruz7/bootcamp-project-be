module Api
  module V1
    class UsersController < ApplicationController
      #protect_from_forgery with: :null_session
      before_action :authorized, only: [:auto_login]

      def index
          users = User.all
          render json: UserSerializer.new(users).serialized_json
      end

      def show
          user = User.find_by(username: params[:username])

          render json: UserSerializer.new(user).serialized_json
      end
      
      def create
        @user = User.create(user_params)
        if @user.valid?
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}
        else
          render json: {error: "Invalid username or password"}
        end
      end

      def login
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}
        else
          render json: {error: "Invalid username or password"}
        end
      end

      def auto_login
        render json: @user
      end

      private

      def user_params
          params.require(:user).permit(:email,:username,:password)
      end
    end
      
  end
  
end