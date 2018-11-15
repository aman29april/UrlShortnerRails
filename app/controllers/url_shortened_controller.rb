class UrlShortenedController < ApplicationController

  before_action :find_url, only: [:show, :shortened]
  before_action :set_urls

  def create
    key = ShortUrl.short(params[:url][:original_url])
    flash[:notice] = "Short link generated!!"
    redirect_to shortened_path(key)
  end

  def show
    redirect_to @url and return if @url
    flash[:error] = "Url not found"
    redirect_to :root
  end

  def shortened
    return redirect_to :root unless @url
  end

  private

  def find_url
    @url = ShortUrl.expand(params[:short_url])
  end

  def set_urls
    @urls = ShortUrl.all
  end

end
