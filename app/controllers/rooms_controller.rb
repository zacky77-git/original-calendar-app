class RoomsController < ApplicationController
  def index; end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    # Room.find(params[:id])を使用して、削除したいチャットルームの情報を取得
    room = Room.find(params[:id])
    # 削除するだけなのでビューの表示は必要はありません。そのため、インスタンス変数ではなく変数としてroomを定義し、destroyメソッドを使用します。
    room.destroy
    # destroyメソッドが実行されたら、rootにリダイレクト
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
