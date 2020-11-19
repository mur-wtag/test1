# frozen_string_literal: true

class CommercialUnitPresenter < ApplicationPresenter
  presents :asset

  def asset_details
    {
      'Type' => asset.type,
      'Owner' => asset.owner,
      'Address' => asset.address,
      'Rooms' => asset.rooms,
      'Price' => asset.price,
      'Shops' => asset.safe_setting(:shops),
      'parking' => asset.safe_setting(:parking),
      'Created at' => asset.created_at
    }
  end
end
