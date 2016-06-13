# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  text       :text
#  sender     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chat < ActiveRecord::Base
  def detail
    @user = User.find_by(nickname: sender)
    {
      text: text,
      user: @user.basic_info
    }
  end
end
