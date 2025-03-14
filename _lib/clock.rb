# 現在の時刻を UTC で取得し、日本時間 (JST) に変換
time = Time.now.getutc + (9 * 60 * 60)  # JST = UTC + 9時間

puts time