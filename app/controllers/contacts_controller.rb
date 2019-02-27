class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @contact = Contact.new

  end

  def index
    @contact = Contact.new(contact_params)
    if @contact.valid?
    else
      render :new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if params[:back]
        format.html { render :new}
      elsif @contact.save
        NoticeMailer.sendmail_blog(@contact).deliver
        format.html { redirect_to contacts_finish_path, notice: 'Blog was successfully created.' }
        format.json { render :new_contact, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:username, :email, :category, :content )
  end
end
