class Application
  def call(env)
    req = Rack::Request.new(env)
    item_name = req.path.gsub('/items/','')

    if req.path.include? '/items/'
      if Item.items.find {|item| item.name == item_name}
        item_price = Item.items.find {|item| item.name == item_name}.price
        responsinator(item_price, 200)
      else
        responsinator('Item not found', 400)
      end
    else
      responsinator('Route not found', 404)
    end
  end

  def responsinator(message,status_code)
    resp = Rack::Response.new
    resp.write message
    resp.status = status_code
    resp.finish
  end

end
