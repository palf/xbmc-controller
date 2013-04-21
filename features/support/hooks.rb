Before do |scenario|
  @actions = []
end


After do |scenario|
  stop_server()
  if not @actions.empty?
    raise 'incomplete actions'
  end
end
