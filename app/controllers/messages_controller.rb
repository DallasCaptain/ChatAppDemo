class MessagesController < ApplicationController
  def index
  end

  def new
  end

  def create
    
    @message = Message.create(user: current_user, chat_id: params[:chat_id], message: params[:message])
    if @message
      flash[:status]= ['messsage added successfully']
    else
      flash[:status] = @message.errors.full_messages
    end
    redirect_to chat_path(params[:chat_id])
  end

  def edit
  end

  def update
  end

  def destroy
    @message = Message.find(params[:id])
    if @message && current_user == @message.user
      Message.destroy(@message)
      flash[:status] = ['message DESTROYED']
    else
      flash[:status] = ['failed to destroy message']
    end

    redirect_to chat_path(params[:chat_id])
  end

  
end
