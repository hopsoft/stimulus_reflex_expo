# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :first_name, length: {minimum: 3, maximum: 20}
  validates :last_name, length: {minimum: 3, maximum: 20}
  validates :email, email: true
end
