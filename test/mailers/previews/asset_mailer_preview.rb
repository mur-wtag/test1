# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/asset_mailer

class AssetMailerPreview < ActionMailer::Preview
  def asset_purchased
    AssetMailer.asset_purchased(Asset.last.id, 'rony.cse36@gmail.com')
  end
end
