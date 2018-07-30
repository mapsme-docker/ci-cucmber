
Then /^I can see image "([^"]*)"$/ do |image|
  expect(page).to have_xpath("//img[@src=\"/static/v3.0/blocks/section/images/#{image}\"]")
end

Then /^"([^"]*)" button is link to "([^"]*)"$/ do |name, link|
  button_link = find(:xpath, "//span[text()='#{name}']/parent::a")
  raise "Link for '#{name}' is wrong" unless button_link[:href] == "#{LOCALADS_ROOT}/#{link}"
end

Then /^Link "([^"]*)" is direct to "([^"]*)"$/ do |name, link|
  a_link = find(:xpath, "//a[text()='#{name}']")
  raise "Link for '#{name}' is wrong" unless a_link[:href] == "#{LOCALADS_ROOT}/#{link}"
end

Then /^Page contains link "([^"]*)"$/ do |link|
  expect(page).to have_xpath("//a[@href='#{link}']")
end

Then /^I can't see footer$/ do
  expect(page).to have_no_css(".page__footer")
end
