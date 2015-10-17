#require 'feature_helper'
require 'rails_helper'

RSpec.describe "Picfair micro:", :type => :feature do

  feature 'As a user, I', js: true, focus: true do
    scenario 'can add a new pic' do
      visit(new_pic_path)
      fill_in('Name', :with => 'Some Image')
      fill_in('Description', :with => 'blah blah')
      fill_in('Url', :with => 'http://placekitten.com/300/350')
      click_button('Create Pic')
      expect(page).to have_content 'Pic was successfully created.'
    end

    scenario 'view the pic I added' do
      skip("TODO")
    end

    scenario 'edit a pic' do
      skip("TODO")
    end

    scenario 'view a list of all pics' do
      skip("TODO")
    end
  end
end
