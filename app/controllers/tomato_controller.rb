class TomatoController < ApplicationController

  def home	
  end

  def new
  	minutes = 25
  	seconds = minutes * 60
  	start_time = Time.now
  	end_time = start_time + seconds
  	puts start_time
  	puts end_time
  end
end
