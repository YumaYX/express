require 'date'
require 'time'

def moon_age(time = Time.now.getlocal("+09:00")) # JST指定
  # 2000年1月6日 18:14 JST に新月があった（東京で観測）
  known_new_moon = Time.new(2000, 1, 6, 18, 14, 0, "+09:00")
  synodic_month = 29.53058867 # 朔望月（日）

  days_since = (time - known_new_moon) / 86400.0 # 秒→日
  (days_since % synodic_month).round(2)
end

def moon_phase_with_emoji(age)
  case age
  when 0..0.99
    ["新月", "🌑"]
  when 1..6.99
    ["三日月", "🌒"]
  when 7..7.99
    ["上弦の月", "🌓"]
  when 8..13.99
    ["十三夜", "🌔"]
  when 14..15.99
    ["満月", "🌕"]
  when 16..21.99
    ["寝待月", "🌖"]
  when 22..22.99
    ["下弦の月", "🌗"]
  when 23..28.99
    ["有明月", "🌘"]
  else
    ["新月", "🌑"]
  end
end

now = Time.now.getlocal("+09:00")
age = moon_age(now)
phase, emoji = moon_phase_with_emoji(age)

puts "Lunar Phase"
puts "# #{emoji}"

puts age