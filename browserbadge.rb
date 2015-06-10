require 'sinatra'
require 'rmagick'

set :public_folder, File.dirname(__FILE__) + '/icons/users'

get '/' do
  "browserbadget.com/:browser/:version
  <br/>
  browser:
    - chrome
    - opera
    - firefox
    - ie
    - edge
    - safari
  <br/>
  version:
    any number will be added to logo image
    if not present - return image without any text
  <br/>
   <img height=20 width=20 src='chrome-42.svg'/>
   <img height=50 width=50 src='opera-42.svg'/>
   <img height=100 width=100 src='ie-42.svg'/>
   <img height=200 width=200 src='safari-42.svg'/>
   <img height=300 width=300 src='firefox-42.svg'/>"
end

get '/:browser/:version' do
  file = "icons/users/#{params[:browser]}-#{params[:version]}.svg"
  text = "<rect x='13' y='22' width='18' height='8' rx='1' fill='#555'/>
    <text font-size='8' x='14' y='29' fill='#fff'>#{params[:version]}+</text>"

  unless File.exist?(file)
    code = File.open("icons/default/#{params[:browser]}.svg").read
    code.insert(code.index('</svg>'), text)
    File.open(file, 'w') { |f| f.write(code) }
  end

  send_file file
end
