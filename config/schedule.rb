set :output, 'log/crontab.log'
set :environment, :development, :production

every 1.day, at: '5:00 am' do
  rake "create_todays_routine:todays_routine"
end
