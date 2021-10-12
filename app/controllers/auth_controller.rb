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

end
