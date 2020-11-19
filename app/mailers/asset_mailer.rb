# frozen_string_literal: true

class AssetMailer < ApplicationMailer
  def asset_purchased(asset_id, email)
    @asset = Asset.find_by(id: asset_id)
    return unless @asset

    mail(to: email, subject: 'Asset Purchased!')
  end
end
