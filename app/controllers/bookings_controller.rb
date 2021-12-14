class BookingsController < ApplicationController

  def index
  @bookings = Booking.all
  end

  def show
  @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    @date_start = @booking.booking_date.strftime("%Y-%m-%d")
    @date_end = @booking.end_date.strftime("%Y-%m-%d")

    found = false
    @all_bookings = Booking.all
    @all_bookings.each do |booking|
      booking_date = booking.booking_date.strftime("%Y-%m-%d")
      end_date = booking.end_date.strftime("%Y-%m-%d")
      if @date_start.between?(booking_date, end_date) || @date_end.between?(booking_date, end_date)
        if booking.field_id == @booking.field_id
          found = true
        end
      end
    end
    if found == true
      redirect_to new_booking_path, notice: "This field is already booked"
    else
      @booking.save!
      redirect_to root_path
      flash[:alert] = "Booking saved."
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
    redirect_to @booking
  else
    render :edit
  end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:title, :price, :booking_date, :end_date, :field_id, :user_id).merge(user_id: current_user.id)
  end
end