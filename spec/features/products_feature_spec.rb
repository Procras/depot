
feature 'products' do
  context 'no products have been added' do
    scenario 'should display a prompt to add a product' do
      visit '/products'
      expect(page).to have_content 'No products yet'
      expect(page).to have_link 'Add a Product'
    end
  end
  context 'creating products' do
    scenario 'prompts user to fill out a form, then displays the new product' do
      visit '/products'
      click_link 'Add a Product'
      fill_in 'Title', with: 'Galaxy 8'
      fill_in 'Description', with: "it does'nt explode in your pants"
      fill_in 'Image url', with: 'https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jpg'
      fill_in 'Price', with: 899.99
      click_button 'Create Product'
      expect(page).to have_content 'Galaxy 8'
      expect(current_path).to eq "/products"
    end
  end
  context 'product has been added' do
    before { Product.create title: 'Iphone', description: 'expensive', id: 1, image_url: "https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jpg", price: 98.99 }
    scenario 'display products' do
      visit '/products'
      expect(page).to have_content 'Iphone'
      expect(page).not_to have_content 'No products yet'
    end
  end
  context 'viewing specific product' do
    let!(:pixel){ Product.create(title: 'Google Pixel', description: "it's really an HTC", image_url: "https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jpg", price: 98.99) }
    scenario 'lets a user view a product' do
      visit '/products'
      click_link 'Show'
      expect(page).to have_content 'Google Pixel'
      expect(page).to have_content "it's really an HTC"
      expect(current_path).to eq "/products/#{pixel.id}"
    end
  end
  context 'updating products' do
    before { Product.create title: 'Iphone', description: 'expensive', id: 1, image_url: "https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jpg", price: 98.99 }
    scenario 'let a user edit a product' do
      visit '/products'
      click_link 'Edit'
      fill_in 'Title', with: 'Iphone knockoff'
      fill_in 'Description', with: 'cheaper'
      click_button 'Update'
      expect(page).to have_content 'Iphone knockoff'
      expect(page).to have_content 'cheaper'
      expect(current_path).to eq '/products/1'
    end
  end
  context 'deleting products' do
    before { Product.create title: 'Iphone', description: 'expensive', id: 1, image_url: "https://i.ytimg.com/vi/LA2Cgan9j5I/maxresdefault.jpg", price: 98.99 }
    scenario 'removes a product when a user clicks a destroy link' do
      visit '/products'
      click_link 'Destroy'
      expect(page).not_to have_content 'Iphone'
      expect(page).to have_content 'Product was successfully destroyed'
    end
  end
end
