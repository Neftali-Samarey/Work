
# Set the initial base item (Global constants)
TARGET_BASE_ITEM = "NGOGEOBKATLBR"
$TARGET_ITEMS = "ATLASPROMO"
$IDSCOUNT_MESSAGE = '20% OFF DISCOUNT'
$DISCOUNT_AMOUNT = 0.80
$MUST_MEET_AMOUNT_OF = 2

def executeRequiredDiscount(itemCount)
	if itemCount >= $MUST_MEET_AMOUNT_OF
		puts "Discount appliable to total cost"
	else
		puts "No discount"
		return
	end

end


Input.cart.line_items.each do |line_item|

  product = line_item.variant.product

  next if product.gift_card?
  if product.tags.include?(TARGET_BASE_ITEM)
  	executeRequiredDiscount()
  end
  # next unless product.id == ""
  # line_item.change_line_price(line_item.line_price * 0.90, message: "My Sale")
end

Output.cart = Input.cart
