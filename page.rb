require 'watir-webdriver'
require 'webdriver-user-agent'
require 'csv'
require 'watir-scroll'
require 'time'




 

def setupBrowserStack

include Selenium

caps = WebDriver::Remote::Capabilities.new
caps['browser'] = 'Firefox'
caps['browser_version'] = '45.0'
caps['os'] = 'Windows'
caps['os_version'] = '7'
caps['resolution'] = '1024x768'
caps["browserstack.debug"] = "true"

$b= Watir::Browser.new(:remote,
  :url => "http://zaqwsx1:Fs54nwmULt7BaSTosZxi@hub.browserstack.com/wd/hub",
  :desired_capabilities => caps)


$b.goto "http://yahoo.com"
end 



puts setupBrowserStack

i=0;
csv_text = File.read('citi2.csv',encoding: "iso-8859-1:UTF-8")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
url= "#{row['url']}"
$b.goto url

csv_text = File.read('size.csv',encoding: "iso-8859-1:UTF-8")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|  
sleep 4
loc1= "#{row['sizeA']}"
loc2= "#{row['sizeB']}"

sleep 5
puts loc1

$b.window.resize_to(loc1, loc2)
i+=1
sleep 7
#$b.screenshot.save i.to_s<<"_"<<loc1<<"x"<<loc2<<".png"
$b.screenshot.save "320/#"<i.to_s<<".png"

sleep 2


end






 


$b.quit