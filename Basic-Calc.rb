def Init

    puts
    print "Please enter your number: "
    numb = gets.chomp
    if numb.to_i.to_s == numb
      Display(numb.to_i)
    else
      puts
      puts "Please put a number"
      Init()
    end

end


def Display(userNumber)

  choices = ["1","2","3","4"]
  puts
  puts "1:) Add: "
  puts "2:) Subtract: "
  puts "3:) Multiply: "
  puts "4:) Exit: "
  puts

  userOperation = ""

  until choices.include?(userOperation)
  print "What will you do to #{userNumber}: "
  userOperation = gets.chomp
  end

  if userOperation == "1"
    addition = Add(userNumber)
    userNumber = addition

  elsif userOperation == "2"
    subtraction = Subtract(userNumber)
    userNumber = subtraction

  elsif userOperation == "3"
    multiply = Multiply(userNumber)
    userNumber = multiply
  else
    puts "Your final number is #{userNumber}"
    puts
    puts "The program will now end"
    abort("Thanks for using!")
  end

  puts
  puts "Your number is #{userNumber}"
  puts

  repeat = ""

  until repeat.upcase == "Y" || repeat.upcase == "N"
    print "Do you want to enter a new number? \n"
    print "[Y/N]: "
    repeat = gets.chomp()
  end

  if repeat.upcase == "Y"
    Init()
  else
    Display(userNumber)
  end

end

def Add(number)

  print "What number do you want to Add to #{number}: "
  addto = gets.chomp()
  if addto.to_i.to_s == addto
    returnAdd = number + addto.to_i
    return returnAdd
  else
    puts
    puts "Please put a number"
  end

end

def Subtract(number)

  print "What number do you want to Subtract from #{number}: "
  subtract = gets.chomp()
  if subtract.to_i.to_s == subtract
    returnSubtraction = number - subtract.to_i
    return returnSubtraction
  else
    puts
    puts "Please put a number"
  end

end

def Multiply(number)

  print "What number do you want Mulitiply to #{number}: "
  multiply = gets.chomp()
  if multiply.to_i.to_s == multiply
    returnMultiply = number * multiply.to_i
    return returnMultiply
  else
    puts
    puts "Please put a number"
  end


end

Init()
