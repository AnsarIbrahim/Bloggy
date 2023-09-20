FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    photo { 'Image' }
    bio { 'This is a sample bio.' }
    post_counter { 0 }
  end
end
