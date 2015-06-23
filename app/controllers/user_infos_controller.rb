class UserInfosController < ApplicationController
	#before_action :logged_in_user
	before_action :correct_user, only: [:destroy, :edit] #no test

	def new
		@user_info = UserInfo.new
	end

	def create
		@user_info = current_user.build_user_info(user_info_params)

		if @user_info.save
			flash[:success] = "Save success!"
			render 'edit'
		else
			render 'new'
		end
	end

	def show
		@user_info = current_user.user_info
	end

	def edit
    @user_info = current_user.user_info
  end

  def update
		@user_info = current_user.build_user_info(user_info_params)

		if @user_info.update_attributes(user_info_params)
			flash[:success] = "Profile updated"
			render 'edit'
		else
			render 'edit'
		end
  end

  private

  	def user_info_params
  		params.require(:user_info).permit(:username, :bio, :avatar)
  	end

  	def correct_user
  		@user_info = current_user.user_info
  		redirect_to root_url if @user_info.nil?
  	end

end
