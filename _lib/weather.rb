require 'open-uri'
require 'json'

class WeatherData
  attr_reader :telop, :maxtemp, :mintemp, :site

  BASE_URL = "https://weather.tsukumijima.net/api/forecast/city/"

  # 天気を絵文字に変換する関数
  def self.weather_to_emoji(weather)
    weather.gsub(/晴れ|快晴/, '☀️')
           .gsub(/晴/, '☀️')
           .gsub(/曇り/, '☁️')
           .gsub(/曇|止む/, '☁️')
           .gsub(/雨/, '☔')
           .gsub(/雪/, '☃️')
           .gsub(/雷/, '⚡')
           .gsub(/霧/, '🌫️')
           .gsub(/みぞれ/, '🌨️')
           .gsub(/のち|後/, '→')
           .gsub(/時々|か/, '/')
  end

  def initialize(location_code)
    @site = location_code
    @telop = ""
    @maxtemp = nil
    @mintemp = nil
    fetch_weather_data
  end

  private

  def fetch_weather_data
    url = "#{BASE_URL}#{@site}"
    begin
      json_data = JSON.parse(URI.open(url).read)

      forecast = json_data["forecasts"].first
      @telop = self.class.weather_to_emoji(forecast["telop"])

      @maxtemp = forecast.dig("temperature", "max", "celsius")&.concat("℃")
      @mintemp = forecast.dig("temperature", "min", "celsius")&.concat("℃")
    
    rescue StandardError => e
      puts "エラー: #{e.message}"
    end
  end
end

# 東京都の天気を取得（東京: 130010）
weather = WeatherData.new("130010")

# 結果を出力
puts "東京の天気"
puts "# #{weather.telop}"
puts "最高気温: #{weather.maxtemp}<br />" if weather.maxtemp
puts "最低気温: #{weather.mintemp}<br />" if weather.mintemp
