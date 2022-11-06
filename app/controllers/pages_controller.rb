class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @page = 'home'
  end

  def catering
    @page = 'catering'
  end

  def info
    @page = 'info'
  end
end
