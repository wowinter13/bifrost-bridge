Socksify::debug = true

Net::HTTP.SOCKSProxy('127.0.0.1', 9050).start(uri.host, uri.port) do |http|
  http.get(uri.path)
end
