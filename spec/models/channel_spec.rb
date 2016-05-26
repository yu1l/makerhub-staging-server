# == Schema Information
#
# Table name: channels
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category    :integer
#  description :text
#  live        :boolean
#  private     :boolean
#  title       :string
#  total       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Channel, type: :model do
  it { should belong_to(:user) }
end
