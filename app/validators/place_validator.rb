class PlaceValidator < ActiveModel::EachValidator
  DEFAULT_NUMBER_OF_DIGITS = 2

  def validate_each(record, attribute, value)
    if value.class != 1.class
      record.errors.add(attribute, " must not be empty")
    else
      record.errors.add(attribute, " must be more 1 of characters") unless value >= 1
      record.errors.add(attribute, " must be less #{DEFAULT_NUMBER_OF_DIGITS} of ") unless value.to_s.length <= DEFAULT_NUMBER_OF_DIGITS
    end
  end
end
