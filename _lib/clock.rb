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

# 絵文字を出力
puts "# #{time_to_emoji(tokyo_time)}"