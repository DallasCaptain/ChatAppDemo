class ChatsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @chat = Chat.create(subject:params[:subject])
    if @chat 
      @chat.users << current_user
      flash[:status] = ['successfully created chat']
      redirect_to chat_path(@chat)
    else
      flash[:status] = @chat.errors.full_messages
      redirect_to user_path(current_user)
    end

  end

  def show
    @user = current_user
    @chat = Chat.find(params[:id])

    @users = User.where.not(id: @chat.users)
  end

  def edit
  end

  def update
  end

  def addUser
    @chat = Chat.find(params[:id])
    @chat.users << User.find(params[:userid])

    redirect_to chat_path(@chat)
  end
  def removeUser
    @chat = Chat.find(params[:id])
    @chat.users.destroy(User.find(params[:userid]))

    redirect_to chat_path(@chat)
  end

  def destroy
  end
end
