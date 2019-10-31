def Init

    secondNumber = 0
    firstNumber = 0
    operator = ""

    puts
    print "Please enter your number: "
    numb = gets.chomp
    if numb.to_i.to_s == numb
      Display(numb.to_f,firstNumber, operator,secondNumber)
    else
      puts
      puts "Please put a number"
      Init()
    end

end


def Display(userNumber,firstNumber, operator,secondNumber)
  manual_catch = 0
  puts
  puts "1:) Add: "
  puts "2:) Subtract: "
  puts "3:) Multiply: "
  puts "4:) Divide: "
  puts "5:) Exit"
  puts "Current number #{userNumber}"
  puts

  print "Use manually, or use the commands, your choice: "
  userOperation = gets.chomp

  command = userOperation.split(" ")
  firstNumber = command[0].to_i
  operator = command[1]
  secondNumber = command[2].to_i

  puts command.count

  if command.count == 3
    if operator.to_s == "+"
      userNumber = firstNumber.to_i + secondNumber.to_i
      manual_catch = 1
    elsif operator.to_s == "-"
      userNumber = firstNumber.to_i - secondNumber.to_i
      manual_catch = 1
    elsif operator.to_s == "/"
      userNumber = firstNumber.to_i / secondNumber.to_i
      manual_catch = 1
    elsif operator.to_s == "*"
      userNumber = firstNumber.to_i * secondNumber.to_i
      manual_catch = 1
    end
  end

if manual_catch == 0
    if userOperation == "1"
      userNumber = Add(userNumber)

    elsif userOperation == "2"
      subtraction = Subtract(userNumber)
      userNumber = subtraction

    elsif userOperation == "3"
      multiply = Multiply(userNumber)
      userNumber = multiply

    elsif userOperation == "4"
      divide = Divide(userNumber)
      userNumber = divide
    elsif userOperation == "5"
      puts "Your final number is #{userNumber}"
      puts
      puts "The program will now end"
      abort("Thanks for using!")
    else
      userNumber = userOperation.to_i
    end
end

  puts
  puts "Your number is #{userNumber}"
  puts
  Display(userNumber,firstNumber, operator,secondNumber)
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

def Divide(number)

  print "What number do you want Divide by #{number}: "
  divide = gets.chomp()
  begin
    if divide.to_i.to_s == divide
      returnDivide = number / divide.to_i
      return returnDivide
    else
      puts
      puts "Please put a number"
    end
  rescue
    print "Error: Divide by zero \n"
    Divide(number)
  end

end

Init()
