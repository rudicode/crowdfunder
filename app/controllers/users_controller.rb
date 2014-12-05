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
          #binding.pry

    if params[:id].to_i === current_user.id
      @user = current_user
      @projects_list = @user.backed_projects
      @totalbacked = @user.pledges.sum(:amount)
      puts @totalbacked
    else
      redirect_to projects_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
