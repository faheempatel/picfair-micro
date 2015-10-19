#require 'feature_helper'
require 'rails_helper'

RSpec.describe "Picfair micro:", :type => :feature do

  feature 'As a user, I', js: true, focus: true do
    scenario 'can add a new pic' do
      # add a pic
      add_image('http://placekitten.com/100/100')
      # check for image
      expect(page).to have_selector 'img', count: 1
    end

    scenario 'view the pic I added' do
      add_image('http://www.fillmurray.com/100/100', 'Bill Murray')
      visit(pics_path)
      find('img').click
      expect(page).to have_content 'Bill Murray'
    end

    scenario 'edit a pic' do
      add_image('http://www.fillmurray.com/100/100', 'Unedited Name')
      click_button('Edit')
      fill_in('Name', :with => 'Edited Name')
      click_button('Update Pic')
      expect(page).to have_content 'Edited Name'
    end

    scenario 'view a list of all pics' do
      # add some pics
      add_image('http://www.fillmurray.com/100/100')
      add_image('http://www.fillmurray.com/200/200')
      add_image('http://www.fillmurray.com/300/300')
      # see if they're all there
      visit(pics_path)
      expect(page).to have_selector 'img', count: 3
    end
  end
end

def add_image(url, name = 'Some Image')
  visit(new_pic_path)
  fill_in('Name', :with => name)
  fill_in('Description', :with => 'blah blah')
  fill_in('Url', :with => url)
  click_button('Create Pic')
end
