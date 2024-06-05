class PagesController < ApplicationController
  def home
    
  end

  def about

  end

  def contact

    # @contact = Contact.new
  end

  def service
    # @project = Project.all
  end

  def service
    # @service = Service.all
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      ContactMailer.contact_email(@contact).deliver_now
      redirect_to new_contact_path, notice: "Your message has been sent."
    else
      render :contact
    end
  end
end
