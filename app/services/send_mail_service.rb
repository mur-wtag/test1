# frozen_string_literal: true

class SendMailService
  attr_reader :asset_id, :receivers

  def self.call(asset_id, receivers: [])
    new(asset_id, receivers).send_mail
  end

  def initialize(asset_id, receivers)
    @asset_id = asset_id
    @receivers = receivers
  end

  def send_mail
    receivers.each do |receiver|
      AssetMailer.asset_purchased(asset_id, receiver).deliver_later
    end
  end
end