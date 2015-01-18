class MessagingController < ApplicationController

  respond_to :html, :js
  def index
    logger.debug "New post: "
    logger.debug "Post should be valid: "
    @user = User.all
    @user_ids = {}
    @user.each do |f|
      @user_ids[f.id.to_s] = f.name
    end
    respond_to do |format|
      @user.each do |users|
        if params[:mid]
          users.received_messages.each do|f|
              if f.id.to_s == params[:mid].to_s
                @msg = f
                logger.debug @msg.to_s
              end
            end
          end
          format.html
          format.js
        end
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
    end




    def trash
      @user = User.all
      @user_ids = {}
      @user.each do |f|
        @user_ids[f.id.to_s] = f.name
      end
      respond_to do |format|
      @user.each do |users|
        if params[:mid]
          users.deleted_messages.each do|f|
              if f.id.to_s == params[:mid].to_s
                @msg = f
                logger.debug @msg.to_s
              end
            end
          end
          format.html
          format.js
        end
      end
    end




    def delete_message
      @user = User.find(params[:user])
      @user.messages.process do |f|
        if f.id == params[:id].to_i
          f.delete
        end
      end
      @user.sent_messages.process do |f|
        if f.id == params[:id].to_i
          f.delete
        end
      end
      redirect_to inbox_path
    end











    def permanent_delete_message
      @user = User.find(params[:user])
      @user.deleted_messages.process do |f|
        if f.id == params[:id].to_i
          f.delete
        end
      end
      redirect_to trash_path
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