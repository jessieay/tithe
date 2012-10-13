class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(params[:organization])
    if @organization.save
      redirect_to @organization, :notice => "Organization saved successfully."
    else
      render :new
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
     redirect_to @organization, :notice => 'Organization was successfully updated.'
    end
  end

  def destroy
     @organization = Organization.find(params[:id])
     @organization.destroy
     redirect_to organizations_path, :notice => 'Organization was successfully deleted.'
  end

  def index
    @organizations = Organization.all
  end
end
