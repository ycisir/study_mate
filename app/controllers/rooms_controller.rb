class RoomsController < ApplicationController

  before_action :set_room, only: [:show]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @topics = Topic.last(10)

    @messages = Message.order(created_at: :desc).last(5)

    if params[:q].present?
      topic = Topic.find_by_name(params[:q])
      @rooms = topic ? topic.rooms : Room.where('name ILIKE :q OR "desc" ILIKE :q', q: "%#{params[:q]}%")
    else
      @rooms = Room.order(created_at: :desc)
    end
  end

  def new
    @room = current_user.rooms.new()
  end

  def create
    @room = current_user.rooms.create(room_params)

    if params[:room][:topic_name].present?
      @topic = Topic.find_or_create_by(name: params[:room][:topic_name])
      @room.topic_id = @topic.id
    end

    if @room.save
      redirect_to @room, notice: 'Room was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :desc, :topic_name)
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
