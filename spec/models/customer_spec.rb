require 'rails_helper'

RSpec.describe Customer do
  it { should have_many(:subscriptions) }
end