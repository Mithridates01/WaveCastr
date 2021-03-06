class AppearancesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearances_#{params[:lobby]}"
  end

  def unsubscribed
    guest.destroy if guest
  end

  def update(data)
    puts "Updating guest status..."
    return unless guest
    if guest.update_attributes(status: data['status'])
      ActionCable.server.broadcast("appearances_#{params[:lobby]}",
                                   guest: guest.name,
                                   guest_id: guest.id,
                                   status: guest.status)
    end
  end
end
