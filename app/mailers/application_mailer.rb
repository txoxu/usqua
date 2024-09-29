# frozen_string_literal: true
# ApplicationMailerですべてのmailerのベースクラス
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
