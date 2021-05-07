require 'rails_helper'

feature 'Creating a Article', type: :feature do
  feature 'User must login and fill in comment' do
    before(:each) do
      User.create(name: 'foo', password: 'password')
        visit '/login' 
        within('#sessions_new') do
        fill_in 'Name', with: 'foo'
        fill_in 'Password', with: 'password'
        end
        click_button 'Log in'
        fill_in 'article_content', with: 'This is a new article.'
        click_button 'commit'
        within('#new_articl') do
        fill_in 'article_title', with: 'Article.'
        fill_in 'article_text', with: 'This is an Article.'
        click_button 'commit'
      end
    end

    scenario 'when you create a new article' do
      expect(page).to have_content('Article was successfully created.')
    end
  end

end

