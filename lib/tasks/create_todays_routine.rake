namespace :create_todays_routine do
  desc "全ユーザのルーティンタスクを作成する"
  task todays_routine: :environment do
    logger = Logger.new 'log/create_todays_routine.log'

    User.find_each do |user|
      begin
        routines = Routine.where(user_id: user.id)
        routines.each do |routine|
          Task.create!(user_id: user.id, content: routine.content, point: 1, classification_id: 2, deadline: Time.current.end_of_day, is_complete: false)
        end
      rescue => exception
        logger.error "user_id: #{user.id}でエラーが発生"
        logger.error exception
        logger.error exception.backtrace.join("\n")
        next
      end
    end
  end
end
