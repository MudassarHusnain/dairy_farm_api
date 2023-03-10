#app/controllers/users_controller.rb
class UsersController < ApplicationController

    def index
        @users = User.all
           if @users
              render json: {
              users: @users
           }
          else
              render json: {
              status: 500,
              errors: ['no users found']
          }
         end
    end
def show
       @user = User.find(params[:id])
           if @user
              render json: {
              user: @user
           }
           else
              render json: {
              status: 500,
              errors: ['user not found']
            }
           end
      end

      def create
        # debugger
         @user = User.new(username:params[:username],email:params[:email],password:params[:password])
             if @user.save
                 login!
                 render json: {
                 status: :created,
                 user: @user
             }
            else
                render json: {
                status: 500,
                errors: @user.errors.full_messages
            }
            end
      end
private

     def user_params
         params.require(:user).permit(:username, :password, :password_confirmation,:email)
     end
end