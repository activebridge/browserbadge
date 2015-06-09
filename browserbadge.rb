require 'sinatra'
require 'rmagick'

get '/' do
  "browserbadget.com/:browser/:version/:size
  <br/>
  browser:
    - chrome
    - chromium
    - opera
    - firefox
    - ie
    - safari
    - konqueror
  <br/>
  version:
    any number will be added to logo image
    if version not present, will return latest
  <br/>
  size:
    if size present, will return _size x size_ logo
    if not, will return 128px x 128px"
end

get '/:browser/:version' do
  file = "icons/users/#{params[:browser]}-#{params[:version]}.svg"
  unless File.exist?(file)
    code = File.open("icons/default/#{params[:browser]}.svg").read
    code.insert(code.index('</svg>'), version(params[:version], true))
    File.open(file, 'w') { |f| f.write(code) }
  end
  send_file file
end

def version(number, plus)
  str = number.to_s + '+' if plus
  case params[:browser]
  when 'chrome'
    "<text font-size='60' x='144' y='230'>#{str}</text>"
  when 'firefox'

  when 'safari'

  when 'ie'
    "<text font-size='150' x='175' y='410'>#{str}</text>"
  when 'opera'
    "<text font-size='1000' x='1300' y='3250'>#{str}</text>"
  when 'edge'
    "<text font-size='150' x='175' y='410'>#{str}</text>"
  end
end
