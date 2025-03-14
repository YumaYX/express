# 現在の時刻を UTC で取得し、日本時間 (JST) に変換
time = Time.now.getutc + (9 * 60 * 60)  # JST = UTC + 9時間

# 時と分を取得
hour = time.hour % 12  # 12時間表記に変換
minute = time.min

# 時計の絵文字の基準点
base_emoji_oclock = 0x1F550  # 🕛 (12:00) ～ 🕚 (11:00)
base_emoji_half   = 0x1F55C  # 🕜 (1:30) ～ 🕦 (11:30)

# 12:30 だけ例外処理 (🕧, U+1F567)
if hour == 0 && minute >= 15 && minute < 45
  emoji_code = 0x1F567
elsif minute < 15 || minute >= 45  # 0-14分 or 45-59分 → ○時ちょうど
  emoji_code = base_emoji_oclock + hour
else  # 15-44分 → ○時半
  emoji_code = base_emoji_half + (hour - 1)
end

# 絵文字を取得
clock_emoji = [emoji_code].pack("U*")

puts "### #{clock_emoji}"
