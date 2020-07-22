require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation tests' do
    it { should validate_presence_of(:name) }
    
    it { should validate_length_of(:name)
      .is_at_most(20)
      .with_message('20 characters in post is the maximum allowed.')}

    it {
      should validate_presence_of(:body)
    }
    it { should validate_length_of(:body)
      .is_at_most(200)
      .with_message('200 characters in post is the maximum allowed.')}
  end

  describe 'Association tests' do
    it { should belong_to(:deal) }
  end
end
