class HomeController < ApplicationController
  def index
    @deathrate_count = DeathRate.all.count
    @birthrate_count = BirthRate.all.count
    @gdp_count = Gdp.all.count
  end

  def deathrateingest
    if DeathRate.ingest_from_api
      @status = 200
    else
      raise 'Ingest failed!'
    end 
  end

  def birthrateingest
    if BirthRate.ingest_from_api
      @status = 200
    else
      raise 'Ingest failed!'
    end 
  end

  def gdpingest
    if Gdp.ingest_from_api
      @status = 200
    else
      raise 'Ingest failed!'
    end 
  end
end
