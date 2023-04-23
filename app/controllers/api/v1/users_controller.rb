module Api
    module V1
        class UsersController < ApplicationController
            protect_from_forgery with: :null_session

            def index
                users = User.all
                render json: UserSerializer.new(users).serialized_json
            end

            def show
                user = User.find_by(username: params[:username])

                render json: UserSerializer.new(user).serialized_json
            end
            

            def create
                data = JSON.parse(request.body.read)

                email = User.find_by(email: data['email'])
                username = User.find_by(username: data['username'])
                
                if email
                    render json: {error: "email already exist"}, status: 422
                else
                    if username
                        render json: {error: "username already exist"}, status: 422
                    else
                        user = User.new(user_params)

                        if user.save
                            render json: UserSerializer.new(user).serialized_json
                        else
                            render json: {error: user.errors.messages}, status: 422
                        end
                    end
                end
              

                
            end

            def login
                data = JSON.parse(request.body.read)
                user = User.find_by(username: data['username'])

                if user
                    if user.password == data['password']
                        render json: UserSerializer.new(user), status: 200
                    else
                        render json: {error: "incorrect password"}, status: 422
                    end
                else
                    render json: {error: "user does not exist"}, status: 422
                end
            end

            private

            def user_params
                params.require(:user).permit(:email,:username,:password)
            end
        end
        
    end
    
end