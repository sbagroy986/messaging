class MessagingController < ApplicationController
  def index
  	@user = User.all
    @user_ids = {}
    @user.each do |f|
      @user_ids[f.id.to_s] = f.name
    end
    if params[:to]
      @user1 = User.where(name: params[:from]).take
      @user2 = User.where(name: params[:to]).take
     @user1.send_message(@user2, { :body => params[:body].to_s, :topic => params[:subject].to_s })
    end
  end
  
  def sent
    @user = User.all
    @user_ids = {}
    @user.each do |f|
      @user_ids[f.id.to_s] = f.name
    end
    if params[:to]
      @user1 = User.where(name: params[:from]).take
      @user2 = User.where(name: params[:to]).take
     @user1.send_message(@user2, { :body => params[:body].to_s, :topic => params[:subject].to_s })
    end
  end

  def trash
    @user = User.all
    @user_ids = {}
    @user.each do |f|
      @user_ids[f.id.to_s] = f.name
    end
    if params[:to]
      @user1 = User.where(name: params[:from]).take
      @user2 = User.where(name: params[:to]).take
     @user1.send_message(@user2, { :body => params[:body].to_s, :topic => params[:subject].to_s })
    end
  end

  def delete_message
    @user = User.find(params[:user])
    @user.messages.process do |f|
      if f.id == params[:id].to_i
        f.delete
      end
    end
    redirect_to inbox_path
  end

  def restore_message
    @user = User.find(params[:user])
    @user.deleted_messages.process do |f|
      if f.id == params[:id].to_i
        f.restore
      end
    end
    redirect_to trash_path
  end

end