require 'digest/md5'

class ShortUrlsController < ApplicationController
  before_action :set_short_url, only: [:show, :update, :destroy]

  # GET /short_urls
  def index
    @short_urls = ShortUrl.order(visits: :desc).limit(100)
    render json: @short_urls
  end

  # GET /short_urls/1
  def show
    if @short_url.update({visits: @short_url[:visits]+1})
      redirect_to @short_url[:url]
    else
      render json: @short_url.errors, status: :unprocessable_entity
    end
  end

  # POST /short_urls
  def create
    url_shortened = ShortUrl.find_by url:params[:url]
    if url_shortened
      render json: url_shortened
    else
      url = short_url_params[:url]
      time_url = url + Time.new.to_s
      short = Digest::MD5.hexdigest(time_url).slice(0,7)
      @short_url = ShortUrl.new({url: url, short: short, visits:0})
      if @short_url.save
        render json: @short_url, status: :created
         #Job
        ShortUrlTitlesJob.perform_later(@short_url);
      else
        render json: @short_url.errors, status: :unprocessable_entity
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_url
      @short_url = ShortUrl.find(params[:short])
    end

    # Only allow a trusted parameter "white list" through.
    def short_url_params
      params.require(:short_url).permit(:short, :url, :title, :visits)
    end
end
