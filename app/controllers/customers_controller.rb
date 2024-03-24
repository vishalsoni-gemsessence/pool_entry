class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # def index
  #   @customers = Customer.all
  # end

  def index
    @customers = if params[:contact_number].present?
                   Customer.where("contact_number LIKE ?", "%#{params[:contact_number]}%")
                 else
                   Customer.all
                 end
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path, notice: "Customer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: "Customer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: "Customer was successfully destroyed."
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :address, :contact_number)
  end
end
