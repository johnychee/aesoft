class UserController < ApplicationController
  def create
    @user = User.new
    @user.email = params[:email]
    @state = @user.save
    respond_to do |format|
      # Tell the UserMailer to send a welcome Email after save
      begin
        UserMailer.welcome_email(@user).deliver
      rescue
        @state = false
      end
      format.js {render :layout => false}
    end
  end
end
