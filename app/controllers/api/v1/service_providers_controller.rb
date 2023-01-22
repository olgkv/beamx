class Api::V1::ServiceProvidersController < ApplicationController
  before_action :authorize_access_request!
  before_action :set_service_provider, only: %i[show update destroy]

  def index
    @servise_providers = ServiceProvider.all

    render json: @servise_providers
  end

  def show
    render json: @service_provider
  end

  def create
    @service_provider = ServiceProvider.new(service_provider_params)

    if @service_provider.save
      render json: @service_provider, status: :created
    else
      render json: @service_provider.errors, status: :unprocessable_entity
    end
  end

  def update
    if @service_provider.update(service_provider_params)
      render json: @service_provider
    else
      render json: @service_provider.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @service_provider.destroy
  end

  private

  def set_service_provider
    @service_provider = ServiceProvider.find(params[:id])
  end

  def service_provider_params
    params.require(:service_provider).permit(:name)
  end
end
