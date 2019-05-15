# Initial Request
#
# сurl -L -v --socks5-hostname 127.0.0.1:9050 'http://hydr@ruzxpnew4@f.onion/' 
#      -H 'Host: hydr@ruzxpnew4@f.onion'
#      -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0'
#      -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
#      -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: http://hydr@ruzxpnew4@f.onion/shops'
#      -H 'Cookie: pregate=1538672853.53f0db8f48fc195fc238a00d45a84ae4.597147be81d2cd4feb1047180cc96f95; gate=1538672884.28f0a6bc4d4368c96399a7c2d8f5b763.7fcc5bccc8fc7181eb15320d338a6f65'
#      -H 'Connection: keep-alive'
#
# require 'faraday' - not working

# require 'curb' - not working
# c = Curl::Easy.new(SOME_ONION_URI) do |curl|
#   curl.proxy_tunnel = true
#   curl.proxy_type = Curl::CURLPROXY_SOCKS5 # also available and default Curl::CURLPROXY_HTTP
#   curl.proxy_url = '127.0.0.1:9050' # local tor client/proxy
#   curl.headers["User-Agent"] = "Mozilla/5.0 (Windows NT 6.1; rv:24.0) Gecko/20100101 Firefox/24.0" #the user agent string from the most recent version of the tor browser
#   curl.headers["Cookie"] = 'pregate=1528672853.53f0db8f48fc195fc238a00d45a84ae4.598147be81d2cd4feb1047180cc96f95; gate=1528672884.28f0a6bc2d4368c96399a7c2d8f5b763.7fcc5bccc8fc7181eb15320d338a6f65'
#   curl.verbose = true
# end

require 'socksify/http'
require 'net/http'
require 'uri'

Socksify::debug = true

SOME_ONION_URI = URI.parse("http://hydr@rzxpnew4@f.onion/")

query = Net::HTTP::Get.new(HYDRA_URI)
query["Host"] = "hydr@ruzxpnew4@f.onion"
query["User-Agent"] = "Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0"
query["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
query["Accept-Language"] = "en-US,en;q=0.5"
query["Referer"] = "http://hydr@ruzxpnew4@f.onion/shops"
query["Cookie"] = "pregate=1528672853.53f0db8f48fc195fc238a00d45a84ae4.598147be81d2cd4feb1047180cc96f95; gate=1528672884.28f0a6bc2d4368c96399a7c2d8f5b763.7fcc5bccc8fc7181eb15320d338a6f65"

response = Net::HTTP.SOCKSProxy('127.0.0.1', 9050).start(HYDRA_URI.host, HYDRA_URI.port) do |http|
  http.request(query)
end

response.body