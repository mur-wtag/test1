# frozen_string_literal: true

class HousePresenter < ApplicationPresenter
  presents :asset

  def asset_details
    {
      'Type' => asset.type,
      'Owner' => asset.owner,
      'Address' => asset.address,
      'Rooms' => asset.rooms,
      'Price' => asset.price,
      'Number of Floor' => asset.safe_setting(:floors),
      'Air Conditioned?' => asset.safe_setting(:air_conditioned) ? "Yes" : "No",
      'Created at' => asset.created_at
    }
  end
end
