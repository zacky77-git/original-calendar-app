class UserTarget

  include ActiveModel::Model
  attr_accessor :monthly_content, :weekly_content, :daily_content

# ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
    MonthlyTarget.create(monthly_content: monthly_content)
    WeeklyTarget.create(weekly_content: weekly_content)
    DailyTarget.create(daily_content: daily_content)
  end
end
