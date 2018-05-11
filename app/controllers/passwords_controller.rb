class PasswordsController < ApplicationController

  before_action :load_password, except: [:index, :create, :new]

  def index
    @q = current_user.passwords.ransack(params[:q])
    @passwords = @q.result
  end

  def new
    @password = Password.new
  end

  def create
    @password = Password.create(params[:password])
    redirect_to :index
  end

  def show
  end

  def edit
  end

  def update
    @password.update(params[:password])
  end

  def destroy
    @password.destroy
  end

  # To copy via ajax, so we dont load the password on the dom until its necessary.
  def copy_to_clipboard
  end

  private
    def load_password
      p params
      @password = Password.find(params[:id])
    end
end
