class DataController < ApplicationController

	def new
		@data = Data.all
	end

	def create
		@data = Data.new
		if @data.save
			redirect_to '/data'
		else
			render 'new'
	end
end
