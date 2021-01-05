class UserTarget

  include ActiveModel::Model
  attr_accessor :monthly_content, :weekly_content, :daily_content, :user_id, :date

# ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
    MonthlyTarget.create(monthly_content: monthly_content, user_id: user_id, date: date)
    WeeklyTarget.create(weekly_content: weekly_content, user_id: user_id, date: date)
    DailyTarget.create(daily_content: daily_content, user_id: user_id, date: date)
  end
end
