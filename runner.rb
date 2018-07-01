require 'unirest'

#index request
# response = Unirest.get("http://localhost:3000/api/products")
# p response.body


#create new item
# response = Unirest.post("localhost:3000/api/products/6", 
#   parameters: {
#     input_name: "Spinny Desk Chair",
#     input_price: 150,
#     input_image_url: "",
#     input_description: "Chair used for sitting at your desk while doing productive, or unproductive, activities. Number one use is for having races down the office hallway."
#   }  
# )
# p response.body

# #update an item
p "Would you like to update an item?"
#create loop for asking for which parameter to update

p "Which item would you like to update?"

response = Unirest.patch("localhost:3000/api/products/6", 
  parameters: {
    input_name: "Spinny Desk Chair",
    input_price: 150,
    input_image_url: "",
    input_description: "Chair used for sitting at your desk while doing productive, or unproductive, activities. Number one use is for having races down the office hallway."
  }  
)
p response.body

#delete an item
# p "Which item would you like to delete? (Enter product ID)"
# product_id = gets.chomp

# response = Unirest.delete("localhost:3000/api/products/#{product_id}")
# p response.body