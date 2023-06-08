class PagesController < ApplicationController
  def home
    @articles = Article.includes(:category).all
    @article = Article.first
    @article2 = Article.second
    @article3 = Article.third
    @categories = Category.all
  end

  def about
    @info = About.first
  end
end
