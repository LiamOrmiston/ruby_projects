class Account
  @@bank_users = Hash.new {}
    attr_reader :name
    attr_reader :balance
    def initialize(name, pin)
        @name = name
        @balance = 100
        @pin = pin
    end

    private
    def pin
        #@pin = 1234
    end

    def pin_error
        "Access denied: incorrect PIN."
    end

    def balance_error
        "You do not have that much money in your account. Your balance is: #{@balance}."
    end

    public
    def display_balance(pin_number)
        if pin_number == pin
          puts "Balance: $#{@balance}."
        else
          puts pin_error
        end
    end
    def withdraw(pin_number, amount)
        if pin_number == pin
            if amount < @balance
                @balance - amount
                puts "Withdraw #{amount}. New balance: $#{@balance}."
            else
                puts balance_error
            end
        else
            puts pin_error
        end
    end
    def deposit(pin_number, amount)
        if pin_number == pin
            @balance + amount
            puts "Deposit #{amount}. New balance: $#{@balance}."
        else
            puts pin_error
        end
    end
end

class CheckingAccount < Account
end
class SavingsAccount < Account
end

ans = ""
puts "Would you like to open an account? (y,n)"
while ans != "y" && ans != "n"
  ans = gets.chomp
  ans.downcase!
  if ans == "y"
    name = ""
    pin = ""
    puts "What is your name?"
    name = gets.chomp
    puts "Hello #{name}, what would you like your pin to be?"
    pin = gets.chomp
    Account.new(name,pin)
    puts "Great! Account created"
  else
    puts "Have a great day!"
  end
end
puts "would you like to withdraw, deposit, or see you balance? (w,d,b)"
choice = gets.chomp
case choice
when "w"
  print "pin please:"
  pin = gets.chomp
  puts "how much would you like to withdraw?"
  wd = gets.chomp
  withdraw(pin, wd)
end
