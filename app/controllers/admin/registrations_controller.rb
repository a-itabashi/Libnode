class Admin::RegistrationsController < Admin::ApplicationController
  def new
    @book_registrations_form = BookRegistrationForm.new
  end

  def create
    @book_registrations_form = BookRegistrationForm.new(book_registration_form_params)
    results = @book_registrations_form.save
    if results[:success]
      redirect_to new_admin_registration_path, success: '書籍の作成が成功しました'
    else
      flash[:danger] = results[:errors]
      render 'new'
      # @book_registrations_form = BookRegistrationForm.new
    end
  end

  def update
    @book_registrations_form = BookUpdateForm.new(book_registration_form_update_params)
    results = @book_registrations_form.update
    # render json: results
    redirect_to edit_admin_registration_path
  end

  private

  def book_registration_form_params
    params.require(:book_registration_form).permit(
      %i[title author saled_at price description image image_raw_url],
      categories_attributes: %i[name],
      places_attributes: %i[shelf column row]
    )
  end

  def book_registration_form_update_params
    params.require(:book_registration_form_update).permit(
      %i[id title image author saled_at price description image image_raw_url categories],
      categories_attributes: %i[name],
      places_attributes: %i[shelf column row]
    )
  end
end
