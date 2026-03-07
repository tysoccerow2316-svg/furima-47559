FactoryBot.define do
  factory :user do
    name        { 'test' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password              { '000000t' }
    password_confirmation { password }
    last_name   { '山口' }
    first_name  { '泰生' }
    last_name_kana { 'ヤマグチ' }
    first_name_kana { 'タイセイ' }
    date_of_birth { '1998-01-06' }
  end
end
