require 'open-uri'
require 'json'


page = 1

users = open("https://api.stackexchange.com/2.2/users?page=#{page}&pagesize=100&order=desc&sort=reputation&site=stackoverflow&filter=!-.wtzeKDnn7I").read

user_ids = []

begin 

  puts page

  u_json = JSON.parse(users)

  user_ids += u_json["items"].map{ |x| x["account_id"]}

  page += 1

  users = open("https://api.stackexchange.com/2.2/users?page=#{page}&pagesize=100&order=desc&sort=reputation&site=stackoverflow&filter=!-.wtzeKDnn7I").read

  sleep(1)

end while u_json["has_more"]


puts user_ids


