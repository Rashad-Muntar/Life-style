require 'rails_helper'

# rubocop:disable Metrics/BlockLength
feature 'Creating a comment', type: :feature do
  feature 'User must login and fill in comment' do
    before(:each) do
      User.create(name: 'foo', password: 'password')
      visit '/login'
      within('#login') do
        fill_in 'Name', with: 'foo'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      fill_in 'article_title', with: 'Article.'
      fill_in 'article_text', with: 'This is a new artile.'
      click_button 'commit'
      within('#article_comments') do
        fill_in 'comment_name', with: 'foo.'
        fill_in 'comment_content', with: 'This is a comment.'
        click_button 'commit'
      end
    end

    scenario 'when you create a new comment' do
      expect(page).to have_content('Comment was successfully created.')
    end
  end

  scenario 'fail when post content field is empty' do
    User.create(name: 'foo', password: 'password')
    visit '/login'
    within('#login') do
      fill_in 'Name', with: 'foo'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    fill_in 'article_title', with: 'Article.'
    fill_in 'article_text', with: ''
    click_button 'commit'
    expect(page).to have_content("Post could not be saved. Text can't be blank")
  end

  scenario 'fail when comment field is empty' do
    User.create(name: 'foo', password: 'password')
    visit '/login'
    within('#login') do
      fill_in 'Name', with: 'foo'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    fill_in 'article_title', with: 'Article.'
    fill_in 'article_text', with: 'This is a new comment.'
    click_button 'commit'
    within('#article_comments') do
      fill_in 'comment_name', with: 'foo.'
      fill_in 'comment_content', with: ''
      click_button 'commit'
    end
    expect(page).to have_content("Content can't be blank")
  end
  # rubocop:enable Metrics/BlockLength
end
