class GdpController < ApplicationController
  def index
    render json: Gdp.all_without_noncountries.collect {|o| {:country => o.country, :date => o.date, :gdp => o.value} }
  end

  def list_countries
    render :json => Gdp.distinct(:country)
  end

  def list_dates
    render :json => Gdp.distinct(:date)
  end

  def list_values
    render :json => Gdp.distinct(:value)
  end

  def count_fields

    country_count = Gdp.distinct(:country).count
    date_count = Gdp.distinct(:date).count
    value_count = Gdp.distinct(:value).count
 
    render :json => { :country_count => country_count, :date_count => date_count, :value_count => value_count }
  end
end
