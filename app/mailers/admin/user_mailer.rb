class Admin::UserMailer < ApplicationMailer
  default from: 'administration@ticketsua.com'

  def block(user)
    @user = user
    mail(to: @user.email, subject: 'You have been blocked')
  end

  def unblock(user)
    @user = user
    mail(to: @user.email, subject: 'Your have been unblocked')
  end
end
