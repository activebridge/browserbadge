require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  erb :index
end

get /\A\/(chrome|opera|firefox|ie|safari)(\/[0-9]{1,3})?(\/[0-9]{2,4}px)?\/?\z/ do |browser, version, size|
  Dir.mkdir('public/icons/users/') unless Dir.exist?('public/icons/users')
  file = "public/icons/users/#{browser}" + path_to_file(version) + path_to_file(size) + '.svg'
  unless File.exist?(file)
    code = File.open("public/icons/default/#{browser}.svg").read
    if !version.nil?
      version.delete! '/'
      width = 8.7 + version.length * 6
      text = "<defs><linearGradient id='grad' x1='0%' y1='0%' x2='0%' y2='100%'><stop offset='0%' style='stop-color:rgb(85,85,85); stop-opacity:1'/><stop offset='100%' style='stop-color:rgb(51, 51, 51); stop-opacity:1'/></linearGradient></defs><rect x='#{32 - width}' y='20' width='#{width}' height='10' rx='1' fill='url(#grad)'/><text font-size='12' x='#{32 - width + 1}' y='29' fill='#fff'>#{version}+</text>"
      code.insert(code.index('</svg>'), text)
    end
    code.gsub!('32px', size.delete('/')) if !size.nil?
    File.open(file, 'w') { |f| f.write(code) }
  end
  send_file file
end

not_found do
  send_file 'public/icons/default/not_found.png'
end

def path_to_file(parameter)
  parameter.nil? ? '' : "-#{parameter.delete '/'}"
end
