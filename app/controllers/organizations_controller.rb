class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new
      if @organization.save
        redirect_to @organzation, notice: "Organization saved successfully."
      end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def index
    @organizations = Organization.all
  end
end