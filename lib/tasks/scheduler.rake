desc "This task is called by the Heroku scheduler add-on"
task :send_digest => :environment do
  User.all.each do |user|
    puts "Sending daily summaries to #{user.username}"
    SummarySenderJob.perform_later(user)
  end
  puts "done."
end
