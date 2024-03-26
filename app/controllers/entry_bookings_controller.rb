class EntryBookingsController < ApplicationController
  before_action :set_customer
  before_action :set_entry_booking, only: [:edit, :update, :destroy]

  def new
    @entry_booking = @customer.entry_bookings.build
  end

  def create
    # binding.pry
    @entry_booking = @customer.entry_bookings.build(entry_booking_params)

    if @entry_booking.save
      respond_to do |format|
        format.html { redirect_to customer_path(@customer), notice: "Entry booking was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Entry booking was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @entry_booking.update(entry_booking_params)
      respond_to do |format|
        format.html { redirect_to customer_path(@customer), notice: "Entry booking was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Entry booking was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry_booking.destroy

    respond_to do |format|
      format.html { redirect_to customer_path(@customer), notice: "Entry booking was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Entry booking was successfully destroyed." }
    end
  end

  private

  def set_entry_booking
    @entry_booking = @customer.entry_bookings.find(params[:id])
  end

  def entry_booking_params
    params.require(:entry_booking).permit(:date, :persons, :active_persons, :amount, :in_time, :out_time, :purpose, :remark, :entry_type_id, :locker_token)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end
