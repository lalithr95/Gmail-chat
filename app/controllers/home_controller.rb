class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
  	@user = User.all
  end
end
