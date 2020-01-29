class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction 

    def initialize(discount = nil)
        @total = 0
        @discount = discount 
        @items = [] 
    end

    def add_item(item, price, quantity = 1)
        @total += price * quantity 
        @last_transaction = price * quantity
        if quantity > 1
            @items.concat([item] * quantity)
        else 
            @items << item
        end

    end

    def apply_discount
        if @discount 
          @total -= @total * @discount / 100.00
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end 
    end

    def void_last_transaction
        @total -= @last_transaction
    end



end

