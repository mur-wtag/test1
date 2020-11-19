# frozen_string_literal: true

class AssetsController < ApplicationController
  before_action :set_asset, only: %i[edit update destroy show]

  def shop
    @assets = Asset.all.order(created_at: :desc)
  end

  def index
    @assets = Asset.all.order(created_at: :desc)
  end

  def new
    @asset = (params[:type].presence || 'House').constantize.new
  end

  def create
    @asset = Asset.new(asset_params)

    respond_to do |format|
      if @asset.save
        format.html { redirect_to assets_path, notice: 'Asset created!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to assets_path, notice: 'Asset updated!' }
      else
        format.html { render :edit }
      end
    end
  end

  def show; end

  def destroy
    @asset.destroy
    redirect_to assets_path
  end

  def buy
    @asset = Asset.find(params[:asset_id])

    SendMailService.call(@asset, receivers: %w[owner@asset.com buyer@asset.com]) if VeryLongTaskService.call
    redirect_to root_path, notice: "Asset purchased successfully!"
  end

  private

  def set_asset
    @asset = Asset.find(params[:id])
  end

  def asset_params
    permitted_fields = House::DEFAULTS.keys
    permitted_fields += ComplexBuilding::DEFAULTS.keys
    permitted_fields += CommercialUnit::DEFAULTS.keys

    params.require(:asset).permit(:type, :owner, :address, :rooms, :sqmt, :price, :image, :delete_image, *permitted_fields)
  end
end