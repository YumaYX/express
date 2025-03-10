# frozen_string_literal: true

require_relative 'itunessongs'

puts "Apple Music - Top songs<br />"

ranking_data = get_ranking_data(10)
extract_ranking(ranking_data).each.with_index(1) do |song, rank|
  s = Song.new(
    song['name'],
    song['artistName'],
    song['url'],
    song['artworkUrl100']
  )
  puts "#{rank}: #{s.label}<br />"
end
