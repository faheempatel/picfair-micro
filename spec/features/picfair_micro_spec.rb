# require 'feature_helper'
require 'rails_helper'

RSpec.describe 'Picfair micro:', type: :feature do
  feature 'As a user, I', js: true, focus: true do
    scenario 'can add a new pic' do
      add_pic('http://placekitten.com/100/100')
      expect(page).to have_selector 'img', count: 1
    end

    scenario 'view the pic I added' do
      add_pic('http://www.fillmurray.com/100/100', 'Bill Murray')

      # Go back to list of pictures
      visit(pics_path)
      # Select newly added picture
      find('img').click

      expect(page).to have_content 'Bill Murray'
      expect(page).to have_selector 'img', count: 1
    end

    scenario 'edit a pic' do
      add_pic('http://www.fillmurray.com/100/100', 'Unedited Name')
      click_button('Edit')
      fill_in('Name', with: 'Edited Name')
      click_button('Update Pic')
      expect(page).to have_content 'Edited Name'
    end

    scenario 'view a list of all pics' do
      # Add some pics
      add_pic('http://www.fillmurray.com/100/100')
      add_pic('http://www.fillmurray.com/200/200')
      add_pic('http://www.fillmurray.com/300/300')
      # See if they're all there
      visit(pics_path)
      expect(page).to have_selector 'img', count: 3
    end
  end
end

def add_pic(url, name = 'Some Image')
  visit(new_pic_path)
  fill_in('Name', with: name)
  fill_in('Description', with: 'blah blah')
  fill_in('Url', with: url)
  click_button('Create Pic')
end
