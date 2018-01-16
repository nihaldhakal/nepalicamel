require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  # handler do |job|
  #   puts "Running #{job}"
  # end

  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end
  # every(10.seconds, 'frequent.job')
  # every(3.minutes, 'less.frequent.job')
  # every(1.hour, 'hourly.job')
  #
  # every(1.day, 'midnight.job', :at => '00:00')
  #
  # every(15.minutes, 'calendar.scheduler', at: ['**:00', '**:15', '**:30', '**:45'], tz: 'UTC') { CalendarScheduler.run! }

  every(1.day, 'scrape.scheduler', at: '00:00') do
    ScrapeScheduler.run!
  end
  # every(10.seconds, 'scrape.scheduler') do
  #   ScrapeScheduler.run!
  # end
end