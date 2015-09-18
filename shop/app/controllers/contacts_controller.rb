class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def index
    @contacts = Contact.paginate(page: params[:page])
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
  
  private

    def contact_params
      params.require(:contact).permit(:title, :message, :response)
    end
    
end
