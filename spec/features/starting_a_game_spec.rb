require 'spec_helper'
require 'board'
require 'cell'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end
  scenario 'Page has field to input name' do
    visit '/new_game'
    expect(page).to have_field('name')
  end
  scenario 'Submit button exists' do
    visit '/new_game'
    expect(page).to have_selector("input[type='submit'][value='Submit']")
  end
  scenario 'I can input my name into form' do
    visit '/new_game'
    fill_in 'name', with: 'Harry'
    click_button 'Submit'
    expect(page).to have_content('Welcome to BattleshipsWeb, Harry')
  end
  scenario 'It has a link to a new game' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    expect(page).to have_selector("input[type='submit'][value='Start Game']")
  end
  scenario 'It will generate a new board' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    expect(page).to have_css("div[id='water']", count: 100)
  end
  scenario 'I will welcome to you to the board' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    expect(page).to have_content("Welcome to the board, Mike")
  end
  scenario 'Place an aircraft carrier' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'aircraft_carrier', with: "A1"
    fill_in 'ac_orientation', with: "horizontally"
    click_button 'Place Aircraft Carrier'
    expect(page).to have_css("div[id='water']", count: 95)
  end
  scenario 'Place an aircraft carrier' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'aircraft_carrier', with: "F1"
    fill_in 'ac_orientation', with: "vertically"
    click_button 'Place Aircraft Carrier'
    expect(page).to have_css("div[id='water']", count: 90)
  end
  scenario 'Place an Battleship' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'battleship', with: "B1"
    fill_in 'bs_orientation', with: "horizontally"
    click_button 'Place Battleship'
    expect(page).to have_css("div[id='water']", count: 86)
  end
  scenario 'Place an Battleship' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'battleship', with: "F5"
    fill_in 'bs_orientation', with: "vertically"
    click_button 'Place Battleship'
    expect(page).to have_css("div[id='water']", count: 82)
  end
end
