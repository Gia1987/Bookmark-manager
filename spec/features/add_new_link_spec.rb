feature 'Add a new link' do
  scenario 'A user can add a link' do
    visit('/')
    expect(page).to have_button('Add Link')
  end

  scenario 'When a user clicks add link, they are redirected to the add link page' do
    visit('/')
    click_on('Add Link')
    expect(page).to have_selector('input')
  end

  scenario 'On submition of a link, I expect the link to be added to the homepage' do
    visit('/')
   click_on('Add Link')
    fill_in('url', :with => 'http://www.featuretest.com')
    click_on('Add Link')
    expect(page).to have_content('http://www.featuretest.com')
  end

  scenario 'Raise a messagge if the user does not insert a correct URL' do
    visit('/')
    click_on('Add Link')
    fill_in('url', :with => 'invalid link')
    click_on('Add Link')
    expect(page).to have_content('This is not a valid website, click here to go back')
  end
end
