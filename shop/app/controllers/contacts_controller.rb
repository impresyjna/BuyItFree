class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def index
    @contacts_with_respond = Contact.where("respond is not null")
    @contacts_without_respond = Contact.where(respond: nil)
  end

  def edit
    @contact = Contact.find(params[:id])
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def create
    @contact = current_user.contacts.create(contact_params)
    if @contact.save
      flash[:success] = "Wysłano wiadomosć"
      redirect_to root_url
    else
      flash[:warning] = "Nie udało się wyslać wiadomosci" 
      render 'new'
    end
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      flash[:success] = "Wiadomosć wysłana"
      redirect_to contacts_url
    else
      render 'edit'
    end
  end
  
  private

    def contact_params
      params.require(:contact).permit(:title, :message, :respond)
    end
    
end
