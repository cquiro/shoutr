class UsersController < Clearance::UsersController
  def show
    @user = User.find(params[:id])
    @shouts = @user.shouts
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
