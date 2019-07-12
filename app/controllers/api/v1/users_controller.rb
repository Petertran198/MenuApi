module Api::V1 
    class UsersController < ApiController
        def index 
            @users = User.all
        end
        def create 
            @user = User.new(user_params)
        end


        private
        def user_params 
            params.require(:user).permit(:email, :password)
        end

        
    end
end