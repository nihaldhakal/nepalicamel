class ScrapeScheduler
  attr_reader :time

  def self.run!
    new(Time.current.to_i).run!
    # CalendarSchedulerJob.perform_later(Time.current.to_i)
  end

  def initialize(time_in_seconds)
    @time = Time.zone.at(time_in_seconds)
  end

  def run!
    Rails.logger.debug "Running ScrapeScheduler for time(#{@time}) at #{Time.current}"
    Product.last.create_price_history_today
    # interval = 15.minutes
    # interval_utc_floor = Time.zone.at((self.time.to_f / interval).floor * interval)
    # users = User.where("date_part('hour', send_time) = ? AND date_part('minute', send_time) = ?", interval_utc_floor.hour, interval_utc_floor.min)
    #
    # Rails.logger.debug "Found #{users.size} users to send agendas"
    #
    # users.each do |user|
    #   begin
    #     Rails.logger.debug "Processing agenda for #{user.email}"
    #     AgendaRunner.new(user.agenda).run! #failsafe to keep loop running
    #   rescue => e
    #     ExceptionNotifier.notify_exception(e, data: {user_id: user.id})
    #   end
    # end
  end

end
