class BirthRate
  include Mongoid::Document
  include Mongoid::Timestamps

  field :country, type: String
  field :date, type: String
  field :value, type: Float
  field :countrydate, type: String

  validates_presence_of :country
  validates_presence_of :date
  validates_presence_of :countrydate
  validates_uniqueness_of :countrydate

  before_validation :create_countrydate


  def self.all_without_noncountries
    response = []
    all_countries = self.distinct(:country).to_a
    droplist = Rails.application.config.droplist

    filtered_countries = all_countries - droplist

    puts filtered_countries.to_s

    filtered_countries.each do |country|
      country_results = self.all.where(:country => country)

      country_results.each do |result|
        response << result
      end
    end

    response
  end

  def self.ingest_from_api
    require 'net/http'
    require 'oj'

    # setup parameters for GET request

    format = "json";
    per_page = 10000;
    date_range = "1990:2010";

    # execute GET request

    birth_rate_api_url = "http://api.worldbank.org/countries/indicators/SP.DYN.CBRT.IN?format=#{format}&per_page=#{per_page}&date=#{date_range}"
    birth_rate_api_uri = URI.parse(birth_rate_api_url)
    res = Net::HTTP.get_response(birth_rate_api_uri)

    # prepare JSON (strip headers)

    json = Oj.load(res.body, {:mode => :object})
    json2 = []
    
    json.each do |line|
      json2 << line
    end

    json2[1].each do |o|
      a = BirthRate.new

      a.country = o["country"]["value"]
      a.date = o["date"]
      a.value = o["value"] 

      a.save
    end
  end

  protected
    def create_countrydate
      self.countrydate = self.country + self.date
    end
end