# frozen_string_literal: true

require_relative 'itunessongs'

puts "💿iTunes Store - Top Songs<br />"

d = get_songs_ranking_data(10)
extract_songs_ranking(d).each.with_index(1) do |ele, rank|
  s = Song.new(
    ele.dig('im:name', 'label'),
    ele.dig('im:artist', 'label'),
    ele['link'].first.dig('attributes', 'href'),
    ele['im:image'].last['label'],
    ele.dig('rights', 'label')
  )
  puts "#{rank}: #{s.label}<br />"
end
