require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validation tests' do
    it {
      should validate_presence_of(:name)
    }

    it {
      should validate_length_of(:name)
        .is_at_most(20)
        .with_message('20 characters in name is the maximum allowed.')
    }
  end

  describe 'Association tests' do
    it { should belong_to(:user) }
    it { should have_many(:deals) }
    it { should have_many(:dealings).dependent(:destroy) }
  end

  context 'validation tests' do
    it 'ensures name presence' do
      group = Group.new().save
      expect(group).to eql(false)
    end
  end

  context 'validation tests' do
    it 'ensures icon presence' do
      group = Group.new(name: 'nike boots').save
      expect(group).to eql(false)
    end
  end

  context 'validation tests' do
    it 'ensures name uniqueness' do
      Group.new(name: 'nike boots').save
      group = Group.new(name: 'nike boots').save
      expect(group).to eql(false)
    end
  end
end
