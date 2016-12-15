class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    item_name = req.path.gsub('/items/','')
    # binding.pry
    if req.path.include? '/items/'
      if Item.items.find {|item| item.name == item_name}
        item_price = Item.items.find {|item| item.name == item_name}.price
        resp.write item_price
        resp.status = 200
      else
        resp.write 'Item not found'
        resp.status = 400
      end
    else
      resp.write 'Route not found'
      resp.status = 404
    end
    resp.finish
  end
end
