describe LineItem, type: :model do
  it { is_expected.to belong_to :product }
  it { is_expected.to belong_to :cart }
end
