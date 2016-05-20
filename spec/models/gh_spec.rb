# == Schema Information
#
# Table name: ghs
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  uid         :string
#  provider    :string
#  nickname    :string
#  email       :string
#  image       :string
#  blog_url    :string
#  profile_url :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Gh, type: :model do
end
