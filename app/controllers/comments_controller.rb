class CommentsController < ApplicationController

	def create
		@writing = Writing.find(params[:writing_id])
		@comment = @writing.comments.create(comment_params)
		redirect_to writing_path(@writing)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter,:user_id)
		end
end
