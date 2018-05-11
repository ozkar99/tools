class PasswordsController < ApplicationController
  before_action :load_password, except: [:index, :create, :new]

  def index
    @q = current_user.passwords.ransack(params[:q])
    @passwords = @q.result
  end

  def new
    @password = current_user.passwords.new
  end

  def create
    @password = current_user.passwords.new(password_params)
    if @password.save
      redirect_to passwords_path, notice: "Password created"
    else
      flash[:alert] = password_errors
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @password.update(password_params)
      redirect_to passwords_path, notice: "Password updated"
    else
      flash[:alert] = password_errors
      render :edit
    end
  end

  def destroy
    @password.destroy
  end

  # To copy via ajax, so we dont load the password on the dom until its necessary.
  def copy_to_clipboard
  end

  private
    def load_password
      @password = Password.find(params[:id])
    end

    def password_params
      params.require(:password).permit(:name, :login, :password, :url, :description)
    end

    def password_errors
      @password.errors.full_messages
    end
end
