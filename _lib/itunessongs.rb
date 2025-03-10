# frozen_string_literal: true

require 'net/http'
require 'json'

def get_ranking_data(num = 10)
  url = "https://rss.marketingtools.apple.com/api/v2/jp/music/most-played/#{num}/songs.json"
  uri = URI(url)
  Net::HTTP.get(uri)
end

def extract_ranking(json_data)
  JSON.parse(json_data).dig('feed', 'results') || []
end

def get_songs_ranking_data(num = 10)
  url = "https://itunes.apple.com/jp/rss/topsongs/limit=#{num}/genre=all/json"
  uri = URI(url)
  Net::HTTP.get(uri)
end

def extract_songs_ranking(json_data)
  JSON.parse(json_data).dig('feed', 'entry') || []
end

class Song
  attr_accessor :name, :artist, :url, :artworkurl, :rights

  def initialize(name, artist, url = '', artworkurl = '', rights = '')
    @name = name
    @artist = artist
    @url = url
    @artworkurl = artworkurl
    @rights = rights
  end

  def label
    "#{@name} - #{@artist}"
  end
end
