require 'rails_helper'

RSpec.describe GroupsController, type: :feature do
describe 'GET /Deals without signing up' do
  Group.create(name: 'nike boots')
    it 'must sign up to create a group' do
      visit groups_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
