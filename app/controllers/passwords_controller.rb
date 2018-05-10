class PasswordsController < ApplicationController
  def index
    @q = current_user.passwords.ransack(params[:q])
    @passwords = @q.result
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    Password.destroy(params[:id])
    redirect_to :index
  end
end
