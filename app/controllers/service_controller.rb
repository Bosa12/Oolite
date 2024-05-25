class ServiceController < ApplicationController
  def project
    @project = Project.all

  end

  def contact
    @contact = Contact.new
  end
end
