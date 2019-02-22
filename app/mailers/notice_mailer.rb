class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  #
  # def sendmail_blog(blog)
  #   @blog = blog #インスタンス変数に代入
  #   mail to: "(your_mail_address)", subject: "新規ブログが作成されました"
  # end


  def sendmail_blog(contact)
    @contact = contact
    mail(to: @contact.email, subject: '問い合わせ')
  end
end
