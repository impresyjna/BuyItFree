class Seller < ActiveRecord::Base
  belongs_to :user
  
    VALID_POST_CODE_REGEX = /\d{2}-\d{3}\z/
    VALID_WORD_REGEX = /\A\D+\z/
    VALID_ACCOUNT_REGEX = /\A[0-9]{26}\z/
    VALID_TELEPHONE_REGEX = /\A[0-9]{7,15}\z/
    
    #Part to be a customer 
    validates :post_code, presence: true, format: { with: VALID_POST_CODE_REGEX }
    validates :city, presence: true, format: {with: VALID_WORD_REGEX }, length: { maximum: 50 }
    validates :name, presence: true, format: {with: VALID_WORD_REGEX }, length: { maximum: 50 }
    validates :surname, presence: true, format: {with: VALID_WORD_REGEX }, length: { maximum: 50 }
    validates :address, presence: true, length: { maximum: 100 }
    validates :telephone, numericality: true, length: { :minimum => 9, :maximum => 15 }
    
    #Part to be a seller 
    validates :account_number, presence: true, format: {with: VALID_ACCOUNT_REGEX, message: "Niepoprawny numer konta" }
    validates_format_of :company_number, :with => VALID_TELEPHONE_REGEX, :allow_blank => true
    validates_format_of :company_post_code, :with =>VALID_POST_CODE_REGEX, :allow_blank => true
    validates_format_of :company_name, :with => VALID_WORD_REGEX, :allow_blank => true
    validates_format_of :company_city, :with => VALID_WORD_REGEX, :allow_blank => true
    
    validates_presence_of :company_address, :if => :company_post_code?, :message => "Można zapisać albo całkowity brak adresu, albo pełen adres!"
    validates_presence_of :company_city, :if => :company_post_code?, :message => "Można zapisać albo całkowity brak adresu, albo pełen adres!"
    validates_presence_of :company_address, :if => :company_city?, :message => "Można zapisać albo całkowity brak adresu, albo pełen adres!"
    validates_presence_of :company_city, :if => :company_address?, :message => "Można zapisać albo całkowity brak adresu, albo pełen adres!"
    validates_presence_of :company_post_code, :if => :company_address?, :message => "Można zapisać albo całkowity brak adresu, albo pełen adres!"
    validates_presence_of :company_post_code, :if => :company_city?, :message => "Można zapisać albo całkowity brak adresu, albo pełen adres!"
    
    
end
