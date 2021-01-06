require 'rails_helper'

RSpec.describe User, type: :model do
  # test validation, associations, class methods
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:pasword_digest)}
  it { should validate_uniqueness_of(:username)}
end
