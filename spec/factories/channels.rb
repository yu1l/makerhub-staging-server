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

FactoryGirl.define do
  factory :channel do
    user nil
    category 1
    description "MyText"
    live false
    private false
    title "MyString"
    total 1
  end
end
