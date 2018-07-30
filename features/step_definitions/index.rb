Given /^I navigate to main localads page$/ do
  visit LOCALADS_ROOT
end

Then /^Page has header$/ do
  expect(page).to have_css(".header .header__container")
end

Then /^I can see cookie message$/ do
  expect(page).to have_css(".cookies-policy")
end

Then /^Page has logo$/ do
  expect(page).to have_css(".logo .logo__name")
  expect(page).to have_css(".logo .logo__unit")
end

Then /^Logo is not clickable$/ do
  expect(page).not_to have_css("div.logo a")
end

Then /^Language "([^"]*)" exist on page$/ do |lang|
  # Check name
  expect(page).to have_css("span.button__item-text span.flag-text",
    text: lang, visible: :all)
  # Check flag img
  expect(page).to have_css("span.button__item-text img.flag", visible: :all)
end

Then /^Language column count is (\d+)$/ do |len|
  expect(page).to have_css('.button__column', count: len, visible: :all)
end

Then /^Advertisement features exist$/ do
  expect(page).to have_css(".section_get-popular-without-budgets")
  expect(page).to have_css(".section_get-popular-without-budgets .section__text")
end

Then /^Advertisers block is exist$/ do
  expect(page).to have_css(".section_get-featured-like")
end

Given /^I have following advertiser[s]?:$/ do |advertisers|
  advertisers.raw.each do |adv|
    expect(page).to have_css("img.#{adv[0]}")
  end
end

Then /^About MapsMe block exist$/ do
  expect(page).to have_xpath("//div[@class=\"section__title\" and contains(text(), \"Advertise on maps\")]")
end

Then /^Google play button exist$/ do
  a_link = find(:xpath, "//a[contains(@class, 'section__app_android')]")
  raise "Link for Google Play is wrong" unless a_link[:href].include? GOOGLE_PLAY_LINK
end

Then /^App Store button exist$/ do
  a_link = find(:xpath, "//a[contains(@class, 'section__app_ios')]")
  raise "Link for App Store is wrong" unless a_link[:href] == APP_STORE_LINK
end

Then /^Block with steps exist$/ do
  expect(page).to have_css(".section_mapsme-1-travel-maps")
end

Then /^Step with text "([^"]*)" exist$/ do |text|
  expect(page).to have_xpath("//div[text()[contains(.,\"#{text}\")]]")
end

Then /^Phone with slider exist$/ do
  expect(page).to have_css(".section__screens")
end

Then /^Block with tariff exist$/ do
  expect(page).to have_css(".section_calculate-fare")
end

Then /^Slider exist$/ do
  expect(page).to have_css(".slider-step_months")
end

Then /^Block click to action exist$/ do
  expect(page).to have_css(".section_start-driving")
end

Then /^First "Instant access" button exist$/ do
  expect(page).to have_xpath("//a/span[text()='Instant access'][1]")
end

Then /^Second "Instant access" button exist$/ do
  expect(page).to have_xpath("//a/span[text()='Instant access'][2]")
end

Then /^Block case studies exist$/ do
  expect(page).to have_css(".section_localbiz-reviews")
end

Then /^Mini review count is (\d+)$/ do |len|
  expect(page).to have_css(".section__item .section__user", count: len)
end

Then /^Block FAQ exist$/ do
  expect(page).to have_css(".section_faq")
end

Then /^Questions count is (\d+)$/ do |len|
  expect(page).to have_css(".section_faq .section__item", count: len)
end

Then /^Block contact us exist$/ do
  expect(page).to have_css(".section_contact-us")
end
