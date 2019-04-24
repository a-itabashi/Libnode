class Admin::RegistrationsController < Admin::ApplicationController
  before_action :admin?, only: %i[create]

  def new
    @book_registrations_form = BookRegistrationForm.new
  end

  def create
    @book_registrations_form = BookRegistrationForm.new(book_registration_form_params)

    if @book_registrations_form.save
      redirect_to new_admin_registration_path
    else
      render :new
    end
  end

  private

  def book_registration_form_params
    params.require(:book_registration_form).permit(
      %i[title author saled_at price description image],
      categories_attributes: %i[name],
      places_attributes: %i[shelf column row]
    )
  end
end
