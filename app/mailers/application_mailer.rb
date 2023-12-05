# frozen_string_literal: true

# The ApplicationMailer serves as the parent class for mailers in the application.
# It contains default configurations and layouts that can be used across mailers.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
