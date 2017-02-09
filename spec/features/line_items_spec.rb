feature 'line items' do
  context 'creating line_products' do
    scenario 'user can add product' do
      visit '/store/index'
      # click_button "Add to Cart: CoffeeScript"
      within(:css, "div#entry") do
        click_button "Add to Cart: CoffeeScript"
      end
      expect(current_path).to eq "/cart"
    end
    it { should have_css('div.entry') }
    it { should have_css('div.price_line') }
    it { should have_css('div.price') }

  end
end
