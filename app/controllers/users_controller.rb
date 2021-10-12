class UsersController < ApplicationController

    def create
        user = Email.create(user_params)
        if user.valid?
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: email, jwt: token}
        else
            render json: {errors: email.errors.full_messages}, status :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end
