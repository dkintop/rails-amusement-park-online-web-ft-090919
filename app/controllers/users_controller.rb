class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      if @user = User.create(user_params)
        session[:user_id] = @user.id
      redirect_to user_path(@user)
      end
    end

    def show
      @user = User.find_by_id(params[:id])
      if session[:user_id] != @user.id 
        redirect_to root_path
      end
    end

    private

    def user_params
       params.require(:user).permit(
      :name,
      :height,
      :nausea,
      :tickets,
      :admin,
      :password,
      :happiness
    )
    end

end