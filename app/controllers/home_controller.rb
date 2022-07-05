class HomeController < ApplicationController
  def index
	  @post = Schedule.all
  end

  def create
	  @post= Schedule.new
	  @post.tutor_id = params[:tutor_id]
	  @post.start_time = params[:start_time]
	  @post.active = params[:active]
	  @post.applied = false
	  @post.save
	  redirect_to "/"
  end

  def update
	  @post = Schedule.find(params[:id])
	  @post.tutor_id = params[:tutor_id]
	  @post.start_time = params[:start_time]
	  @post.active = params[:active]
	  @post.applied = params[:applied]
	  @post.save
	  redirect_to "/"
  end

  def delete
	  Schedule.find(params[:id]).destroy
	  redirect_to "/"
  end

  def create_form
  end

  def update_form
	  @post = Schedule.find(params[:id])
  end
	
  def search_reservation
  end
	
  def apply_form
  end

  def overlap?(x,y)
	  (x.first-y.end)*(y.first-x.end) > 0
  end
	
  def apply
	  @post = Schedule.find_by(tutor_id: params[:tutor_id], start_time: params[:start_time])
	  @exist = Schedule.find_by(tutor_id: params[:tutor_id], start_time: (params[:start_time].to_datetime + (30/1440.0)))
	  # if @exist.nil?
	  # redirect_to "/home/apply_fail"
	  # else 
	  # redirect_to "/"
	  # end
	  
	  if @post.nil?
		  redirect_to "/home/fail" and return
	  end
	  
	  if !@post.nil?
		  if @post.active==1
			  if !@exist.nil?
				  if params[:time_option]==20 
					  @post.time_option = params[:time_option]
					  @post.active = 2
					  @post.applied = true
					  @post.save
					  redirect_to "/"
					  return
				  end
				  if params[:time_option]==40 
					  redirect_to "/home/apply_fail"
					  return
				  end
			  end
			  if @exist.nil?
				  @post.time_option = params[:time_option]
				  @post.active = 2
				  @post.applied = true
				  @post.save
				  redirect_to "/"
				  return
			  end
		  end
		  if @post.active==2
			  redirect_to "/home/apply_fail"
			  return 
		  end
	  end
  end
	
  def booking_available
	  
  end
	
  def search_tutor_form
  end
	
  def search_tutor 
  end

  def search_time_form
  end
	
  def search_time 
  end
	
	# def reply_create
	#   @post= Reply.new
	#   @post.article_id = params[:article_id]
	#   @post.content = params[:content]
	#   @post.save
	#   redirect_to "/"
	# end
	
	# def reply_delete
	#   Reply.find(params[:reply_id]).destroy
	#   redirect_to "/"
	# end
	
	# def reply_update_form
	# @reply = Reply.find(params[:reply_id])  
	# end
	
	# def reply_update 
	#   @reply = Reply.find(params[:reply_id])
	#   @reply.content = params[:content]
	#   @reply.save
	#   redirect_to '/'
	# end
	
end
