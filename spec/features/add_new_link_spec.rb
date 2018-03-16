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
    fill_in('title', :with => 'Featuretest')
    click_on('Add Link')
    expect(page).to have_content('Featuretest')
  end

  scenario 'Raise a messagge if the user does not insert a correct URL' do
    visit('/')
    click_on('Add Link')
    fill_in('url', :with => 'invalid link')
    click_on('Add Link')
    expect(page).to have_content('This is not a valid website, click here to go back')
  end

  scenario 'user wants to go back to homepage and not add link' do
    visit('/')
    click_on('Add Link')
    click_on('Go Back')
    expect(page).to have_content('Makers Academy')
    expect(page).to have_content('Google')
    expect(page).to have_content('Facebook')
  end
end
