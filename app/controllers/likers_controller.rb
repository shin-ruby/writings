class LikersController < ApplicationController
	before_action :authenticate_user!


	def create
		user = current_user.id
		@writing = Writing.find(params[:writing_id])
		@liker = Liker.create(user_id: user, writing_id: @writing.id)

		respond_to do |format|
			format.html { redirect_to @writing }
			format.js
		end
	end

	def destroy
		@liker_id = Liker.find_by(user_id: current_user.id)
		@writing = Writing.find(@liker_id.writing_id)
		Liker.find_by(id: @liker_id).destroy
		respond_to do |format|
			format.html { redirect_to @writing }	
			format.js
		end
	end


end
