# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  # Make sure to set this to your verified sender!
  default from: 'Asset Manager <manager@asset.com>',
          reply_to: 'Asset Management Support <support@asset.com>'

  layout 'mailer'
end
