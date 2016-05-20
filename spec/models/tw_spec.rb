# == Schema Information
#
# Table name: tws
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  uid                 :string
#  provider            :string
#  access_token        :string
#  access_token_secret :string
#  description         :text
#  image               :string
#  location            :string
#  name                :string
#  nickname            :string
#  url                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Tw, type: :model do
end
