# frozen_string_literal: true

def rand_num
  srand
  rand(0..20)
end

# 当たり判定のロジック
def check_winning(slot_board)
  # 横の揃いチェック
  slot_board.each do |row|
    next unless row.uniq.size == 1

    if row[0] == '７' # 横揃いが「７」の場合は大当たり
      puts '🎉 大当たり！ 🎉'
      exit
    else
      puts '🎉 当たり！ 🎉'
    end
    return
  end

  # 斜めの揃いチェック
  diagonal_checks = [
    [slot_board[0][0], slot_board[1][1], slot_board[2][2]], # 左上→右下
    [slot_board[0][2], slot_board[1][1], slot_board[2][0]]  # 右上→左下
  ]

  diagonal_checks.each do |diagonal|
    next unless diagonal.uniq.size == 1

    if diagonal[0] == '7️⃣' # 斜め揃いが「７」の場合は大当たり
      puts '🎉 大当たり！ 🎉'
      exit
    else
      puts '🎉 当たり！ 🎉'
    end
    return
  end
end

# 各リールのデータ
f = %w[🔔 7️⃣ 💎 🍇 💎 🍇 🏴 🍒 🍇 💎 🍇 7️⃣ 🤡 🍇 💎 🍇 🍒 🏴 🍇 💎 🍇]
s = %w[💎 7️⃣ 🍇 🍒 💎 🔔 🍇 🍒 💎 🏴 🍇 🍒 💎 🔔 🍇 🍒 💎 🏴 🍇 🍒 🤡]
t = %w[🍇 7️⃣ 🏴 🔔 💎 🍇 🤡 🔔 💎 🍇 🍒 🔔 💎 🍇 🤡 🔔 💎 🍇 🤡 🔔 💎]



# 各リールを回転させて結果を取得
def spin_reel(reel)
  index = rand_num % reel.size
  # 配列スライスの範囲をリールの長さで調整
  (reel[index..] + reel[0, 3 - (reel.size - index) % 3]).first(3)
end

def slot_machine(f, s, t)
  # 各リールをスピン
  reel1 = spin_reel(f)
  reel2 = spin_reel(s)
  reel3 = spin_reel(t)

  # スロット盤の生成
  slot_board = [reel1, reel2, reel3].transpose
  slot_board.each do |row|
    puts "｜#{row.join('｜')}｜<br />"
  end
  puts
  check_winning(slot_board)
end


puts "Slot Machine<br />"
# スロットを回す
slot_machine(f, s, t)
