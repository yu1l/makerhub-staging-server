# == Schema Information
#
# Table name: follows
#
#  id              :integer          not null, primary key
#  followable_id   :integer          not null
#  followable_type :string           not null
#  follower_id     :integer          not null
#  follower_type   :string           not null
#  blocked         :boolean          default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe Follow, type: :model do
end
