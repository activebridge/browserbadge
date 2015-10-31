require 'sinatra'

BG = %{
  <defs>
    <linearGradient id='grad' x1='0%' y1='0%' x2='0%' y2='100%'>
      <stop offset='0%' style='stop-color:rgb(85,85,85);stop-opacity:1'/>
      <stop offset='100%' style='stop-color:rgb(51,51,51);stop-opacity:1'/>
    </linearGradient>
  </defs>
  <rect x='26%' y='66%' width='74%' height='34%' rx='1' fill='url(#grad)'/>
}

TEXT = "<text font-size='11' x='28%%' y='95%%' fill='#fff' font-family='Verdana'>%s+</text>"

set :public_folder, "#{File.dirname(__FILE__)}/public"

get '/' do
  erb :index
end

get(%r{\A\/(chrome|opera|firefox|ie|safari)\/?([0-9]{1,3})?\/?([0-9]{2,4}px)?\/?\z}) do |browser, version, size|
  file = "public/icons/#{browser}-#{version}-#{size}.svg"
  File.open(file, 'w') { |f| f.write(svg(browser, version, size)) } unless File.exist?(file)
  send_file file
end

not_found { send_file 'public/icons/default/not_found.png' }

private

def svg(browser, version, size)
  code = File.open("public/icons/default/#{browser}.svg").read
  code.insert(code.index('</svg>'), BG + TEXT % version) if version
  code.gsub!('32px', size) if size
  code
end
