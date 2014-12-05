class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(projects_path, notice: 'User was successfully created')
    else
      render :new
    end
  end

  def show
    @user = current_user
    @projects_list = @user.backed_projects
 end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
