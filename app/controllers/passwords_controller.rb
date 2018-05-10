class PasswordsController < ApplicationController
  def index
    @q = current_user.passwords.ransack(params[:q])
    @passwords = @q.result
  end

  def new
    @password = Password.new
  end

  def create
    @password = Password.create(params[:password])
  end

  def edit
    @password = Password.find(params[:id])
  end

  def update
    @pasword = Password.find(params[:id])
    @password.update(params[:password])
  end

  def destroy
    @password = Password.find(params[:id])
    @password.destroy
  end
end
