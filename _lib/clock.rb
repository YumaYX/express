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
  when 4 then return "🌄"  # 夜明け前
  when 5 then return "🌅"  # 夜明け
  when 6 then return "🌞"  # 朝（日差しが強まり始める）
  when 7 then return "🏙️"  # 朝の都市
  when 8 then return "🌤"  # 午前（少し雲があるが明るい）
  when 9 then return "🌞"  # 午前中（太陽が高くなる）
  when 10 then return "☀️"  # 昼前（明るく快晴）
  when 11 then return "🔆"  # 真昼（最も明るい時間）
  when 12 then return "🍽️"  # ランチタイム
  when 13 then return "🏖️"  # 午後（のんびりした雰囲気）
  when 14 then return "🌤️"  # 午後（少し日が傾き始める）
  when 15 then return "🌥️"  # 夕方前（少し雲が出てくる）
  when 16 then return "🌇"  # 夕方（オレンジ色の空）
  when 17 then return "🏞️"  # 日没前（自然が美しい時間）
  when 18 then return "🌆"  # 日暮れ（街の光が目立ち始める）
  when 19 then return "🌓"  # 宵（半月が見え始める）
  when 20 then return "🌃"  # 夜（街の明かりが灯る）
  when 21 then return "🌠"  # 夜（流れ星が見えることも）
  when 22 then return "✨"  # 深夜前（静かな夜）
  when 23 then return "🌙"  # 真夜中（月が輝く）
  when 0 then return "💤"  # 深夜（眠る時間）
  when 1 then return "🦉"  # 夜更け（夜行性の動物が活動）
  when 2 then return "🌌"  # 夜更け（星がよく見える）
  when 3 then return "🌑"  # 最も暗い時間帯（新月のように）
  else return "❓"  # 無効な時間
  end
end

# 絵文字を出力
puts "# #{time_to_emoji(tokyo_time)}#{sky_brightness(tokyo_time.hour)}"