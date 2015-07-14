class WritingsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
	before_action :correct_user, only: [:destroy, :edit] #no test

	def index
		@writings = current_user.writings
	end

	def create
		@writing = current_user.writings.build(writing_params)
		if @writing.save
			flash[:success] = 'Writing created!'
			redirect_to @writing
		else
			render 'new'
		end
	end

	def show
		@writing = current_user.writings.find(params[:id])
	end

	def new
		@writing = Writing.new
	end

	def destroy
		@writing.destroy
		flash[:success] = "Writing deleted"
		redirect_to request.referrer || root_url
	end

	def edit
		@writing = Writing.find(params[:id])
	end

	def update
		@writing = Writing.find(params[:id])

		if @writing.update_attributes(writing_params)
			flash[:success] = "Writing updated"
			render 'edit'
		else
			render 'edit'
		end
	end


	private

		def writing_params
			params.require(:writing).permit(:title, :content, :photo, :tag_list)
		end

		def correct_user
  		@writing = current_user.writings.find_by(id: params[:id])
  		redirect_to root_url if @writing.nil?
  	end

end
