class PagesController < ApplicationController
  include Rails.application.routes.url_helpers
  def home
  end

  def about
  end

  def gallery
    # @images = Gallery.all.map { |image| url_for(image.photo) }

    # @images = []
    # # Project.all.each do |project|
    # #   project.images.each do |image|
    # #     @images << image.blob.filename
    # #   end
    # # end

    # Gallery.all.each do |image|
      @images = Gallery.all.map { |image| url_for(image.photo) }
    # end
  end

  def contact

  end

  def service
     @project = Project.all
  end

  def project
     @project = Project.all
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
