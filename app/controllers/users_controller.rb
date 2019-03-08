class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:top]

  def index
    @users = User.all.includes(:blogs)
    @user= current_user
  end

  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user.id), notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to blog_url(@user.id), notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def top; end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
