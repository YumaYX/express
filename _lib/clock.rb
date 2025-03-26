require 'time'

def time_to_emoji(time)
  hour = time.hour
  minute = time.min

  if minute.between?(0, 14)
    emoji_index = hour % 12
  elsif minute.between?(45, 59)
    # オクロック（ちょうどの時間）を表示
    emoji_index = hour % 12 + 1
  else
    # 30分（ハーフ）の時間を表示
    emoji_index = hour % 12 + 12
  end

  emojis = ["🕛", "🕐", "🕑", "🕒", "🕓", "🕔", "🕕", "🕖", "🕗", "🕘", "🕙", "🕚",
            "🕧", "🕜", "🕝", "🕞", "🕟", "🕠", "🕡", "🕢", "🕣", "🕤", "🕥", "🕦"]

  emojis[emoji_index]
end

# 現在の日本時間（Asia/Tokyo）を取得
tokyo_time = Time.now.getlocal("+09:00")

def sky_brightness(hh)
  case hh
  when 4 then puts "🌄"  
  when 5 then puts "🌅"  
  when 6 then puts "🌞"  
  when 7 then puts "🏙️"  
  when 8 then puts "🌤"  
  when 9 then puts "🌞"  
  when 10 then puts "☀️"  
  when 11 then puts "🔆"  
  when 12 then puts "🍽️"
  when 13 then puts "🏖️"  
  when 14 then puts "🌤️"  
  when 15 then puts "🌥️"  
  when 16 then puts "🌇"  
  when 17 then puts "🏞️"  
  when 18 then puts "🌆"  
  when 19 then puts "🌓"  
  when 20 then puts "🌃"  
  when 21 then puts "🌠"  
  when 22 then puts "✨"  
  when 23 then puts "🌙"  
  when 0 then puts "💤"  
  when 1 then puts "🦉"  
  when 2 then puts "🌌"  
  when 3 then puts "🌑"  
  else puts "❓"  
  end
end

# 絵文字を出力
puts "# #{time_to_emoji(tokyo_time)}#{sky_brightness(tokyo_time.hour)}"