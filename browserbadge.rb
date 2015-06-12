require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  erb :index
end

get /\A\/(chrome|opera|firefox|ie|safari)(?(3)\/|\/?)([0-9]{1,3})?(\/?)\z/ do |browser, version, _third|
  if version.nil?
    file = "public/icons/default/#{browser}.svg"
  else
    file = "public/icons/users/#{browser}-#{version}.svg"
    text = "<rect x='13' y='22' width='18' height='8' rx='1' fill='#555'/>
      <text font-size='8' x='14' y='29' fill='#fff'>#{version}+</text>"
  end
  unless File.exist?(file)
    code = File.open("public/icons/default/#{browser}.svg").read
    code.insert(code.index('</svg>'), text)
    File.open(file, 'w') { |f| f.write(code) }
  end
  send_file file
end

not_found do
  send_file 'public/icons/default/not_found.svg'
end
