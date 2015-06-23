class UserInfosController < ApplicationController

	def new
		@user_info = UserInfo.new
	end

	def create
		@user = User.find(current_user.id)
		@user_info = @user.build_user_info(user_info_params)

		if @user_info.save
			flash[:success] = "Save success!"
			render 'edit'
		else
			render "new"
		end
	end

	def show
		@user = User.find(current_user.id)
		@user_info = @user.user_info
	end

	def edit
		@user = User.find(current_user.id)
    @user_info = @user.user_info
  end

  def update
  	@user = User.find(current_user.id)
		@user_info = @user.build_user_info(user_info_params)

		if @user_info.update_attributes(user_info_params)
			flash[:success] = "Profile updated"
			render 'edit'
		else
			render 'edit'
		end
  end

  private

  	def user_info_params
  		params.require(:user_info).permit(:username, :bio)
  	end

end
