class AuthController < ApplicationController

    def login
        user = User.find_by(user: params[:username])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Welcome back, #{user.username}"}
        else
            render json: {failure: "Login failed! Email or password invalid"}
            end
    end

    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: 'No User Logged In'}
        end
    end

    def session_user
        decoded_hash = decoded_token
        if !decoded_hash.empty?
            user_id = decoded_hash[0]['user_id']
            @user = User.find_by(id:user_id)
        else
            nil
        end
    end


end
