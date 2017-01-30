describe Product, type: :model do
  it 'is not valid with a price of less than 1 cent' do
    product = Product.create title: 'Iphone', description: 'expensive', id: 1, image_url: "https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jpg", price: 0.00
    expect(product).to have(1).error_on(:price)
    expect(product).not_to be_valid
  end
  it 'is not valid unless it has a unique name' do
    Product.create title: 'Iphone', description: 'expensive', id: 1, image_url: "https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jpg", price: 98.99
    product = Product.create title: 'Iphone', description: 'expensive', id: 1, image_url: "https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jpg", price: 98.99
    expect(product).to have(1).error_on(:title)
    expect(product).not_to be_valid
  end
  it 'is not valid unless it has a correct image format' do
    product = Product.create title: 'Iphone', description: 'expensive', id: 1, image_url: "https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jg", price: 98.99
    expect(product).to have(1).error_on(:image_url)
    expect(product).not_to be_valid
  end
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image_url) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
  it { is_expected.to have_many :line_items }
end
