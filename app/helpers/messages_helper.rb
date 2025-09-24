module MessagesHelper
  def formatted_timestamp(time)
    time.in_time_zone("Asia/Kolkata").strftime("%d %B %Y, %I:%M %p")
  end
end