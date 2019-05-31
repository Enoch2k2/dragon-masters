class StaticController < ApplicationController
  before_action :redirect_if_signed_in
  
  def index
  end
end
