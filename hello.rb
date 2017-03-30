require 'sinatra'
#require 'sinatra/reloader' 
require './caesar_cipher.rb'


get '/' do
	#color = ""
	color = change_color
	erb :index, :locals => {:encryptedMessage => "", :color=>color}
    
end

post '/runMethod' do
	color = change_color
    encryption = caesar_cipher(params['message'],params['shiftFactor'].to_i)
	erb :index, :locals => {:encryptedMessage => encryption, :color => color}
end

def change_color
   "##{"%06x" % (rand * 0xffffff)}"
end

