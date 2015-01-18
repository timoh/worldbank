class BirthrateController < ApplicationController
  def index
    if params[:limit].to_i >= 1
      limit = params[:limit].to_i
      render json: BirthRate.all_without_noncountries_limited(limit).collect {|o| {:country => o.country, :date => o.date, :death_rate => o.value} }
    else
      render json: BirthRate.all_without_noncountries.collect {|o| {:country => o.country, :date => o.date, :death_rate => o.value} }
    end
  end

  def list_countries
    render :json => BirthRate.distinct(:country)
  end

  def list_dates
    render :json => BirthRate.distinct(:date)
  end

  def list_values
    render :json => BirthRate.distinct(:value)
  end

  def count_fields

    country_count = BirthRate.distinct(:country).count
    date_count = BirthRate.distinct(:date).count
    value_count = BirthRate.distinct(:value).count
 
    render :json => { :country_count => country_count, :date_count => date_count, :value_count => value_count }
  end
end