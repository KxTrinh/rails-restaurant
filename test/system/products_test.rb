require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    check "Available" if @product.available
    check "Catering" if @product.catering
    check "Dairy free" if @product.dairy_free
    fill_in "Description", with: @product.description
    check "Featured" if @product.featured
    check "Gluten free" if @product.gluten_free
    check "Kosher" if @product.kosher
    fill_in "Name", with: @product.name
    check "Peanut free" if @product.peanut_free
    fill_in "Price", with: @product.price
    check "Vegan" if @product.vegan
    check "Vegetarian" if @product.vegetarian
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    check "Available" if @product.available
    check "Catering" if @product.catering
    check "Dairy free" if @product.dairy_free
    fill_in "Description", with: @product.description
    check "Featured" if @product.featured
    check "Gluten free" if @product.gluten_free
    check "Kosher" if @product.kosher
    fill_in "Name", with: @product.name
    check "Peanut free" if @product.peanut_free
    fill_in "Price", with: @product.price
    check "Vegan" if @product.vegan
    check "Vegetarian" if @product.vegetarian
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
