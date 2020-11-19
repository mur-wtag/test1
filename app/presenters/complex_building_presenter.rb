# frozen_string_literal: true

class ComplexBuildingPresenter < ApplicationPresenter
  presents :asset

  def asset_details
    {
      'Type' => asset.type,
      'Owner' => asset.owner,
      'Address' => asset.address,
      'Rooms' => asset.rooms,
      'Price' => asset.price,
      'Units' => asset.safe_setting(:units),
      'Created at' => asset.created_at
    }
  end
end
