describe Cart, type: :model do
  it { is_expected.to have_many :line_items }
end
