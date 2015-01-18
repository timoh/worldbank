class HomeController < ApplicationController
  def index
    @deathrate_count = DeathRate.all.count
    @birthrate_count = BirthRate.all.count
    @gdp_count = Gdp.all.count
  end

  def deathrateingest
    @status = 404
    if DeathRate.ingest_from_api
      @status = 200
    else
      @status = 500
      raise 'Ingest failed!'
    end
    render json: @status 
  end

  def birthrateingest
    @status = 404
    if BirthRate.ingest_from_api
      @status = 200
    else
      @status = 500
      raise 'Ingest failed!'
    end 
    render json: @status 
  end

  def gdpingest
    @status = 404
    if Gdp.ingest_from_api
      @status = 200
    else
      @status = 500
      raise 'Ingest failed!'
    end
    render json: @status  
  end
  
end
