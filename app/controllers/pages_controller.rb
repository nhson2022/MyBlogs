class PagesController < ApplicationController
  def home
  end

  def about
    @info = About.first
  end
end
