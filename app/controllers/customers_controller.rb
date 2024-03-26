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
    @entry_bookings = @customer.entry_bookings.ordered
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      respond_to do |format|
        format.html { redirect_to customers_path, notice: "Customer was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Customer was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      respond_to do |format|
        format.html { redirect_to customers_path, notice: "Customer was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Customer was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_path, notice: "Customer was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Customer was successfully destroyed." }
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :address, :contact_number)
  end
end
