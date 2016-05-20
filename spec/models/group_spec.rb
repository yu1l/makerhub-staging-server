# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  private    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uuid       :string
#  streaming  :boolean
#

require 'rails_helper'

RSpec.describe Group, type: :model do
end
