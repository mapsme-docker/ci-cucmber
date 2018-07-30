require 'cucumber'
require 'selenium-webdriver'
require 'capybara/cucumber'

Capybara.register_driver :chrome_headless do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[ no-sandbox headless disable-gpu window-size=1280,1024 --ignore-certificate-errors ]
    },
    acceptInsecureCerts: true
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

if ENV['HEADLESS']
  Capybara.default_driver = :chrome_headless
else
  Capybara.default_driver = :selenium_chrome
end

if $headless_server.nil?
  if ENV['HEADLESS']
    require 'headless'
    # allow display autopick (by default)
    # allow each headless to destroy_at_exit (by default)
    # allow each process to have their own headless by setting reuse: false
    # $headless_server = Headless.new(reuse: true)
    $headless_server = Headless.new(reuse: true, destroy_at_exit: false)
    $headless_server.start

    puts "Process[#{Process.pid}] started headless server display: #{$headless_server.display}"
    puts Capybara.default_driver, "default driver" + "######################################"
  end
end

at_exit do
  unless $headless_server.nil?
    puts "Process[#{Process.pid}] destroying headless server on display: #{$headless_server.display}"
    $headless_server.destroy
  end
end

if !ENV['LOCALADS_ROOT'].nil? && !ENV['LOCALADS_ROOT'].empty?
  LOCALADS_ROOT = ENV['LOCALADS_ROOT']
else
  LOCALADS_ROOT = "https://localbiz.mapsme.devmail.ru/en"
end

puts "Local ads root is: #{LOCALADS_ROOT}"

#LOCALADS_ROOT = "https://localbiz.maps.me/en"
APP_STORE_LINK = "https://itunes.apple.com/app/id510623322"
GOOGLE_PLAY_LINK = "https://play.google.com/store/apps/details?id=com.mapswithme.maps.pro"
