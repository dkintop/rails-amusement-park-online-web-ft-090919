class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.create()

      redirect_to user_path(@user)
    end

    private

    def user_params
      
    end

end