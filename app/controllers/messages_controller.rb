class MessagesController < ApplicationController
  def index
    # @messageには、Message.newで生成した、Messageモデルのインスタンス情報を代入
    @message = Message.new
    # paramsに含まれているroom_idを代入
    @room = Room.find(params[:room_id])
    # チャットルームに紐付いている全てのメッセージ情報に紐づくユーザー情報を、includes(:user)と記述をすることにより、ユーザー情報を1度のアクセスでまとめて取得
    @messages = @room.messages.includes(:user)

    @index_diaries = Diary.where('start_time <= ?', Date.today).order('start_time ASC').limit(5)
    @index_events = Event.where('start_time >= ?', Date.today).order('start_time ASC').limit(5)
  end

  # createアクションを定義
  def create
    @room = Room.find(params[:room_id])
    # @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成
    @message = @room.messages.new(message_params)
    # @messageに代入し、saveメソッドでメッセージの内容をmessagesテーブルに保存
    # メッセージを保存できた場合とできなかった場合で条件分岐
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    # メッセージの内容(content)をmessagesテーブルへ保存 #画像ファイルの保存 ログインしているユーザーのidと紐付いている、メッセージの内容(content)を受け取れるように許可
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
