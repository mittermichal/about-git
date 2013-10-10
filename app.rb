
#!/usr/bin/env ruby
#encoding:utf-8

require 'net/http'
require 'json'
require 'uri'
require 'cgi'
exit 0 if ARGV.empty?

GRAPH_API_URL = 'http://graph.facebook.com/'
FB_API_URL    = 'http://api.facebook.com/'

def ok?(response)
  response.code == "200"
end

uri_for_page = "#{GRAPH_API_URL}idnes.cz"
p uri_for_page
response = Net::HTTP.get_response(URI.parse(uri_for_page))
p response.code
p JSON.parse(response.body)['id']

uri_about_article = "http://api.facebook.com/method/links.getStats?urls=#{ARGV[0]}&format=json"

response = Net::HTTP.get_response(URI.parse(uri_about_article))

url_likes_count = JSON.parse(response.body)['like_count']
url_shares_count = JSON.parse(response.body)['share_count']