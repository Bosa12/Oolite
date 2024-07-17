class ContactsMailbox < ApplicationMailbox

  def process
    email = mail.from.first
    subject = mail.subject
    body = mail.body.decoded


    Contact.create(email: email, subject: subject, body: body)
     # Aqui você pode processar o email recebido
    # Por exemplo, extrair informações e salvar em um modelo de banco de dados
  end
end
