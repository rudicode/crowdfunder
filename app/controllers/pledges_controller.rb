class PledgesController < ApplicationController
	def create
		@pledge = Pledge.new(pledges_params)
		@pledge.user_id = current_user.id
		@pledge.project_id = params[:project_id]

		if @pledge.save
			redirect_to project_path(@pledge.project), notice: "Pledge Recorded"
		else
			redirect_to project_path(@pledge.project), notice: "??"
		end

	end	

	private
	def pledges_params
		params.require(:pledge).permit(:amount)
	end
end