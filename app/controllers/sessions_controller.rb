class SessionsController < ApplicationController
  def new
    @user_name_form = UserNameForm.new
  end

  # POST /registrations
  def create
    @user_name_form = UserNameForm.new(user_name_form_params)

    respond_to do |format|
      if @user_name_form.valid?
        session[:user_name] = @user_name_form.name
        format.html { redirect_to rooms_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    session[:user_name] = nil
    redirect_to root_path
  end

  private

  def user_name_form_params
    params.require(:user_name_form).permit(:name)
  end
end
