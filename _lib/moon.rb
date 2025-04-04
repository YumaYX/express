require 'date'

def moon_age(date = Date.today)
  known_new_moon = Date.new(2000, 1, 6)
  days_since = (date - known_new_moon).to_i
  synodic_month = 29.53058867
  age = days_since % synodic_month
  age.round(2)
end

def moon_phase_with_emoji(age)
  case age
  when 0..1
    ["新月", "🌑"]
  when 1..6.382
    ["三日月", "🌒"]
  when 6.382..8.382
    ["上弦の月", "🌓"]
  when 8.382..13.765
    ["十三夜", "🌔"]
  when 13.765..15.765
    ["満月", "🌕"]
  when 15.765..21.148
    ["寝待月", "🌖"]
  when 21.148..23.148
    ["下弦の月", "🌗"]
  when 23.148..29.530
    ["有明月", "🌘"]
  else
    ["新月", "🌑"]
  end
end

today = Date.today
age = moon_age(today)
phase, emoji = moon_phase_with_emoji(age)

puts emoji
