set :output, 'log/crontab.log'
set :environment, :development

job_type :rake, 'cd :path && :environment_variable=:environment bundle exec rake :task :output'

every 1.day, at: '5:00 am' do
  rake "create_todays_routine:todays_routine"
end
