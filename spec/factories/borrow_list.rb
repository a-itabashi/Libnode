FactoryBot.define do
  factory :borrow_list do
    book_id { 1 }
    user_id { 1 }
    return_date { '9999/1/1' }
  end
end
