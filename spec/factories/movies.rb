# frozen_string_literal: true

require 'factory_bot_rails'

FactoryBot.define do
  factory :movie do
    name { Faker::Name.name }
    image { Faker::LoremFlickr.image }
  end
end
