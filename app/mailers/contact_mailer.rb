class ContactMailer < ApplicationMailer
  default from: "olite@uk.co"

  def contact_email(contact)
    @contact = contact
    mail(to: "email address", subject: "New Contact Message")
  end
end
