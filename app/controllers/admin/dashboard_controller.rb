class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD'], except: :loggedIn
  
  def show
  end

  def loggedIn
    redirect_to '/admin/products'
  end

end
