require 'time'

def year_progress 
  now = Time.now.getlocal("+09:00") # 日本時間（JST） 
  start_of_year = Time.new(now.year, 1, 1, 0, 0, 0, "+09:00") 
  end_of_year = Time.new(now.year + 1, 1, 1, 0, 0, 0, "+09:00")
  elapsed_seconds = now - start_of_year 
  total_seconds = end_of_year - start_of_year
  progress = (elapsed_seconds / total_seconds * 100).round(2)

  puts "今年の進捗率:<br />#{progress}%"
end

year_progress
