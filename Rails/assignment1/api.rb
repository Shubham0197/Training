require 'json'
require 'rest-client'
require 'open-uri'

@id =  6
#https://reqres.in/api/users/2
url = "https://reqres.in/api/users"
print url,"\n"
response1 = RestClient.post url, {
  "name": "morpheus",
  "job": "leader"
}
data_h = JSON.parse(response1)
@id         = user['id']
url = "https://reqres.in/api/users/#{@id}"
response2 = RestClient.get url
print response.body
#data_h = JSON.parse(response)
#print data_h
#response = RestClient.get(url)
#data_h = JSON.parse(response)
#print data_h.keys
#@counter = 0
#@note = []
#data_h['data'].each do |user|
#  @id         = user['id']
#  @email      = user['email']
#  @first_name = user['first_name']
#  @last_name  = user['last_name']
#  @avatar     = user['avatar']
#  if User.where("id = ?", @id).count == 1
#    @user = User.find(@id)