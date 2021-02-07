class Score < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :golfcourse
  validates :golfcourse_id, :presence => true 

  def self.search(search)
    today = Date.today
    before_3month = today - 90
    before_6month = today - 180
    puts today
    if search == "0"
      puts  "全期間"
      return self.all
    elsif search == '直近3ヶ月'
      puts  "直近3ヶ月"
      played_year_range = before_3month..today
      return Score.where(played_date: played_year_range)
      # @maildbs = Maildb.where(date: @from..@to)
    elsif search == '直近6ヶ月'
      puts  "直近6ヶ月"
      played_year_range = before_6month..today
      return Score.where(played_date: played_year_range)
      
    elsif search != "0"
        played_year_range = "#{search}/1/1".in_time_zone.all_year
        puts "年指定"
        return Score.where(played_date: played_year_range)
    end
  end
end
