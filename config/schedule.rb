every :hour do
  rake 'scraiping_from_Amazon'
end

every 1.day, at: '4:00 am' do
  rake 'send_reminder'
end

every 20.minutes do
  rake 'do_not_sleep'
end
