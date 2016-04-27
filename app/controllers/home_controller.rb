# Root
class HomeController < ApplicationController
  def index
    @records = Record.all
  end
end
