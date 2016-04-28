# Root
class HomeController < ApplicationController
  def index
    @users = User.where(live: true)
  end
end
