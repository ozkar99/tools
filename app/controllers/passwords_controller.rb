class PasswordsController < ApplicationController
  def index
    @passwords = current_user.passwords
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
