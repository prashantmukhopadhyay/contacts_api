class ContactGroupsController < ApplicationController
  def index
    render json: ContactGroup.find(params[:user_id])
  end

  def show
    render json: ContactGroup.find(params[:id])
  end

  def create
    contact_group = ContactGroup.new(params[:contact_group])
    if contact_group.save
      render json: contact_group
    else
      render json: contact_group.errors, status: :unprocessible_entity
    end
  end

  def update
    contact_group = ContactGroup.find(params[:id])
    if contact_group.update_attributes(params[:contact_group])
      render json: contact_group
    else
      render json: contact_group.errors, status: :unprocessible_entity
    end
  end

  def destroy
    ContactGroup.find(params[:id]).destroy
    head :ok
  end
end
