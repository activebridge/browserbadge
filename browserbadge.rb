require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  erb :index
end

get /\A\/(chrome|opera|firefox|ie|safari)(\/[0-9]{1,3})?(\/[0-9]{2,4}px)?\/?\z/ do |browser, version, size|
  file = "public/icons/users/#{browser}" + path_to_file(version) + path_to_file(size) + '.svg'
  unless File.exist?(file)
    code = File.open("public/icons/default/#{browser}.svg").read
    if !version.nil?
      text = "<rect x='13' y='22' width='18' height='8' rx='1' fill='#555'/><text font-size='8' x='14' y='29' fill='#fff'>#{version.delete '/'}+</text>"
      code.insert(code.index('</svg>'), text)
    end
    code.gsub!('32px', size.delete('/')) if !size.nil?
    File.open(file, 'w') { |f| f.write(code) }
  end
  send_file file
end

not_found do
  send_file 'public/icons/default/not_found.svg'
end

def path_to_file(parameter)
  parameter.nil? ? '' : "-#{parameter.delete '/'}"
end
