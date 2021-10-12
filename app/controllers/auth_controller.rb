class AuthController < ApplicationController

    def login
        user = Email.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: email, jwt: token, success: "Welcome back, #{user.email}"}
        else
            render json: {failure: "Login failed! Email or password invalid"}
            end
    end

end
