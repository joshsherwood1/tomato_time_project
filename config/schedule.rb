# To log/monitor output, uncomment
set :output, './log/cron.log'

# every :day, at: '6pm' do
every 1.minute do
  rake 'send_digest'
  log_text = "#{DateTime.now} | rake send_digest completed successfully"
  puts log_text
end
