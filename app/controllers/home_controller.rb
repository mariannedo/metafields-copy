class HomeController < ApplicationController
  def index
    # import_products
    paste_metafields
  end

  def import_products
    # # start copy sesh
    # ShopifyAPI::Base.site = copy_url

    # # get products
    # products = ShopifyAPI::Product.all
    # products.each do |p|
    #   # new_product = Product.create(title: p.title, handle: p.handle, pid: p.id)
    #   #get metafields 
    #   p.metafields.each do |m|
    #     # new_metafield = Metafield.create(pid: p.id, namespace: 'c_f', key: m.key, value: m.value, product_id: new_product.id)
    #   end
    # end
    # ShopifyAPI::Base.clear_session

    @products = Product.all
    @metafields = Metafield.all
  end

  def paste_metafields
    # start copy sesh
    ShopifyAPI::Base.site = paste_url

    # loop through products
    products = ShopifyAPI::Product.all
    products.each do |p|
      # if product exists (compare handles)
      existing_product = Product.find_by(handle: p.handle)
      if(existing_product)
        # add metafields
        existing_product.metafields.each do |em| 
          m = ShopifyAPI::Metafield.new(:namespace => 'c_f', :key => em.key, :value => em.value, :value_type => 'string')
          p.add_metafield(m)
        end
      end
    end
    ShopifyAPI::Base.clear_session

    @products = Product.all
    @metafields = Metafield.all
  end
end
