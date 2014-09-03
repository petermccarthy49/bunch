Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
	fill_in arg1, with: arg2
end

When(/^I click "(.*?)"$/) do |arg1|
  click_button arg1
end

Then(/^the address of the midpoint should be displayed$/) do
  expect(page).to have_content("20 Brick Lane")
end

Then(/^"(.*?)" should be displayed$/) do |arg1|
  expect(page).to have_content(arg1)
end

Then(/^a map should be displayed with the origins and a midpoint$/) do
	sleep 10
  expect(page).to _have_map
  expect(page.evaluate_script('mainMap.markers.length')).to eq(3)
end

def _have_map
	have_css('.gm-style')
end
