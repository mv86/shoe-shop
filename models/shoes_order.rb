require_relative '../db/sql_runner'

class ShoeOrder

  attr_reader :id, :full_name, :address, :quantity, :size

  def initialize(params)
    @id = nil || params['id'].to_i
    @full_name = params['full_name']
    @address = params['address']
    @quantity = params['quantity'].to_i
    @size = params['size'].to_i
  end

  def save
    sql = "INSERT INTO shoe_orders (
    full_name,
    address,
    quantity,
    size) VALUES (
    '#{@full_name}',
    '#{@address}',
    #{@quantity},
    #{@size})
    RETURNING *"
    shoe_order = SqlRunner.run(sql)
    @id = shoe_order.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM shoe_orders"
    all_orders = SqlRunner.run(sql)
    all_orders.map { |order| ShoeOrder.new(order) }
  end

end