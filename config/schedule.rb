every :hour do
  rake 'scraiping_from_Amazon'
end

every 1.day, at: '4:00 am' do
  rake 'send_reminder'
end
