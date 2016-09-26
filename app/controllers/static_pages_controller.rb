class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  	@message = Message.new
  end

  def portfolio
  end

  
end
