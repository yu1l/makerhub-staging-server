class UserPolicy
  attr_reader :user, :other

  def initialize(user, other)
    @user = user
    @other = other
  end

  def anonymous?
    @other.nil?
  end

  def me?
    @user == @other
  end
end
