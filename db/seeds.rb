# db/seeds.rb

ActiveRecord::Base.transaction do
  begin
    # Створення користувачів
    user1 = User.create!(name: 'John Doe', email: 'john11@example.com', password: 'password', password_confirmation: "password")
    user2 = User.create!(name: 'Jane Smith', email: 'jane11@example.com', password: 'password', password_confirmation: "password")

    # Створення товарів
    product1 = Product.create!(
      name: 'T-shirt',
      description: 'A cool t-shirt',
      price: 19.99,
      product_type: 'clothing',
      category: 'Tops',
      color: 'Red',
      photo_path: 'products/tshirt.jpg'
    )

    product2 = Product.create!(
      name: 'Jeans',
      description: 'Comfortable jeans',
      price: 49.99,
      product_type: 'clothing',
      category: 'Bottoms',
      color: 'Blue',
      photo_path: 'products/jeans.jpg'
    )

    product3 = Product.create!(
      name: 'Sneakers',
      description: 'Stylish sneakers',
      price: 79.99,
      product_type: 'footwear',
      category: 'Shoes',
      color: 'White',
      photo_path: 'products/sneakers.jpg'
    )

    product4 = Product.create!(
      name: 'Jacket',
      description: 'Warm jacket',
      price: 99.99,
      product_type: 'clothing',
      category: 'Outerwear',
      color: 'Black',
      photo_path: 'products/jacket.jpg'
    )

    # Створення варіантів доставки
    delivery_option1 = DeliveryOption.create!(name: 'Standard Shipping', price: 5.00)
    delivery_option2 = DeliveryOption.create!(name: 'Express Shipping', price: 15.00)

    # Створення замовлень
    order1 = Order.create!(user: user1, delivery_option: delivery_option1, total_price: 24.99)
    order2 = Order.create!(user: user2, delivery_option: delivery_option2, total_price: 114.99)

    # Створення товарів у замовленнях
    OrderItem.create!(order: order1, product: product1, quantity: 1, price: 19.99)
    OrderItem.create!(order: order1, product: product2, quantity: 1, price: 5.00) # Discounted item
    OrderItem.create!(order: order2, product: product3, quantity: 1, price: 79.99)
    OrderItem.create!(order: order2, product: product4, quantity: 1, price: 35.00) # Discounted item

    # Створення відгуків
    Review.create!(user: user1, product: product1, content: 'Great t-shirt!', rating: 5)
    Review.create!(user: user2, product: product3, content: 'Very comfortable sneakers.', rating: 4)

    # Створення відгуків про сервіс
    Feedback.create!(user: user1, message: 'Love the products!')
    Feedback.create!(user: user2, message: 'Fast shipping, thanks!')

  rescue ActiveRecord::RecordInvalid => e
    puts "Transaction failed: #{e.message}"
    raise ActiveRecord::Rollback # Скасовує всі зміни в транзакції, якщо є помилка
  end
end