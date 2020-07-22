require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe 'Association tests' do
    it { should belong_to(:author) }
    it { should have_many(:dealings).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:groups) }
  end
end
