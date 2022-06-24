require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { described_class.new(name: 'Rice', measuring_unit: 'kilogram', price: 5) }

  it 'Should not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
