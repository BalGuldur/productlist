require 'net/http'

uri = URI('http://chudo.mawisoft.ru/integration/xml/client.jsp?id=60')
req = Net::HTTP::Get.new(uri)
req.basic_auth 'ka@miracle-systems.ru', 'poRO18'
res = Net::HTTP.start(uri.hostname, uri.port) {|http| http.request(req)}
puts res.body
puts "/n"
