# frozen_string_literal: true

require 'factory_bot_rails'

FactoryBot.define do
  factory :showtime do
    theater { %w[sala1 sala2 sala3 sala4 sala 5 sala6 sala7 sala8].sample }
    schedule { %w[Night Tanda Matinee].sample }
  end
end
