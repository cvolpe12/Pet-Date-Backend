class Api::V1::PlayDatesController < ApplicationController
  before_action :find_play_date, only: [:update]

  def index
    @play_dates = PlayDate.all
    render json: @play_dates
  end

  def update
    @play_date.update(play_date_params)
    if @play_date.save
      render json: @play_date, status: :accepted
    else
      render json: { errors: @play_date.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def play_date_params
    params.permit(:requestor_id, :requested_id, :confirmed_date)
  end

  def find_play_date
    @play_date = PlayDate.find(params[:id])
  end
end
