require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  erb :index
end

get '/:browser' do
  file = "public/icons/default/#{params[:browser]}.svg"
  if File.exist?(file)
    send_file file
  else
    erb :error
  end
end

get '/:browser/:version' do
  browsers = %w(chrome opera firefox ie safari)
  if browsers.include?(params[:browser])
    file = "public/icons/users/#{params[:browser]}-#{params[:version]}.svg"
    text = "<rect x='13' y='22' width='18' height='8' rx='1' fill='#555'/>
      <text font-size='8' x='14' y='29' fill='#fff'>#{params[:version]}+</text>"
    unless File.exist?(file)
      code = File.open("public/icons/default/#{params[:browser]}.svg").read
      code.insert(code.index('</svg>'), text)
      File.open(file, 'w') { |f| f.write(code) }
    end
    send_file file
  else
    erb :error
  end
end

not_found do
  erb :error
end
