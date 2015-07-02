class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@writings = @user.writings.paginate(page: params[:page])
	end

end
