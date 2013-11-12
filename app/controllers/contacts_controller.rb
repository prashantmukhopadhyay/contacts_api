class ContactsController < ApplicationController
  def index
    render json: Contact.contacts_for_user_id(params[:user_id])
  end

  def show
    render json: Contact.find(params[:id])
  end

  def create
    contact = Contact.new(params[:contact])

    if contact.save
      render json: contact
    else
      render json: contact.errors, :status => :unprocessable_entity
    end
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update_attributes(params[:contact])
      render json: contact
    else
      render json: contact.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    contact.find(params[:id]).destroy
    head :ok
  end

  def favorites
    render json: Contact.favorites(params[:user_id])
  end

  def comments
    render json: Contact.comments(params[:user_id], params[:id])
  end
end
