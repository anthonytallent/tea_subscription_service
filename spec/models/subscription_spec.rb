require 'rails_helper'

RSpec.describe Subscription do
  it { should belong_to(:customer) }
  it { should have_many(:subscription_teas) }
end