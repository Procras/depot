feature 'store' do
  context 'view catalogue' do
    before do
      Product.create title: 'Iphone', description: 'expensive', image_url: "https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jpg", price: 98.99
    end
    scenario 'displays all products' do
      visit '/store/index'
      expect(page).to have_content 'Iphone'
    end
  end
  context 'price' do
    scenario 'shows properly formatted price' do
      Product.create title: 'Iphone', description: 'expensive', image_url: "https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jpg", price: 98.99
      visit 'store/index'
      expect(page).to have_content('$98.99')
    end
  end
end
