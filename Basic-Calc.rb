def Init ###Holds the Inital values, obv

    secondNumber = 0
    firstNumber = 0
    operator = ""
    userNumber = ""
    Display(userNumber,firstNumber, operator,secondNumber)
end


def Display(userNumber,firstNumber, operator,secondNumber)
  ###Does interpreting and displays the options.
  ###Most of the things are named logically, so it should be pretty easy to follow

  manual_catch = 0###Resets the manual catch for built in functions
  puts
  puts "1:) Add: "
  puts "2:) Subtract: "
  puts "3:) Multiply: "
  puts "4:) Divide: "
  puts "5:) Adding Machine Mode: "
  puts "6:) Set Number: "
  puts "7:) Instuctions / Syntax: "
  puts "8:) Exit"
  puts "Current number #{userNumber}"
  puts

  print "Use manually, or use the commands, your choice: "
  userOperation = gets.chomp

  isManual = ManualCheck(manual_catch, userNumber, userOperation)
  ###Explained in function definition

  if isManual[1] == 1 ###Checks to see if you did a manual operation
    manual_catch = 1
    userNumber = isManual[0]
    ###Its kinda cool, returning multiple things returns an array, I didn't know it did that
    ###Makes some things a lot easier, and I'm, gonna use it more in the future
  end

  if manual_catch == 0
    ###This is the built in operations, kinda useless now, but that was I had originally
    if userOperation == "1"
      userNumber = Add(userNumber)###In function for all
    elsif userOperation == "2"
      subtraction = Subtract(userNumber)
      userNumber = subtraction
    elsif userOperation == "3"
      userNumber = Multiply(userNumber)
    elsif userOperation == "4"
      userNumber = Divide(userNumber)
    elsif userOperation == "5"
      AddingMachine()
    elsif userOperation == "6"###Sets the current number used, mostly for debug
      puts "Press enter when finished: "
      userOperation = gets().chomp
      userNumber = userOperation
    elsif userOperation == "7"
      Instructions()
    elsif userOperation == "8"
      puts "Your final number is #{userNumber}"
      puts
      puts "The program will now end"
      abort("Thanks for using!")
    else###Also for debug, mostly
      puts "Command no recognized, please retry"
      print "Press enter to continue"
      gets()
    end
  end
  Display(userNumber,firstNumber, operator,secondNumber)
end

def ManualCheck(manual_catch, userNumber, userOperation)
  command = userOperation.split("")
  x = 0
  for i in command
    if i.to_i.to_s == i
      x += 1
      next
    else
      puts command[x - 1]
      break
    end
  end
  operator = "+"
  puts command.count

  if command.count == 1
    puts "line 91"
    firstNumber = userNumber
    secondNumber = command[0]
    if operator.to_s == "+"
      userNumber = firstNumber.to_f + secondNumber.to_f
    elsif operator.to_s == "-"
      userNumber = firstNumber.to_f - secondNumber.to_f
    elsif operator.to_s == "/"
      userNumber = (firstNumber.to_f / secondNumber.to_f).round(2)
    elsif operator.to_s == "*"
      userNumber = firstNumber.to_f * secondNumber.to_f
    end
  end


  if command.count == 2
    firstNumber = command[0].to_f
    secondNumber = command[1].to_f
    if operator.to_s == "+"
      userNumber = firstNumber.to_f + secondNumber.to_f
    elsif operator.to_s == "-"
      userNumber = firstNumber.to_f - secondNumber.to_f
    elsif operator.to_s == "/"
      userNumber = (firstNumber.to_f / secondNumber.to_f).round(2)
    elsif operator.to_s == "*"
      userNumber = firstNumber.to_f * secondNumber.to_f
    end
  end
  manual_catch = 1
  return userNumber, manual_catch
end

def Add(number)

  print "What number do you want to Add to #{number}: "
  addto = gets.chomp()
  if addto.to_i.to_s == addto
    returnAdd = number.to_f + addto.to_f
    return returnAdd
  else
    puts
    puts "Please put a number"
    Add(number)
  end

end

def Subtract(number)

  print "What number do you want to Subtract from #{number}: "
  subtract = gets.chomp()
  if subtract.to_i.to_s == subtract
    returnSubtraction = number.to_f - subtract.to_f
    return returnSubtraction
  else
    puts
    puts "Please put a number"
    Subtract(number)
  end

end

def Multiply(number)

  print "What number do you want Mulitiply to #{number}: "
  multiply = gets.chomp()
  if multiply.to_i.to_s == multiply
    returnMultiply = number.to_f * multiply.to_f
    return returnMultiply
  else
    puts
    puts "Please put a number"
    Multiply(number)
  end


end

def Divide(number)
  print "What number do you want Divide by #{number}: "
  divide = gets.chomp()
  begin
    if divide.to_i.to_s == divide
      returnDivide = (number.to_f  / divide.to_f).round(2)
      return returnDivide
    else
      puts
      puts "Please put a number"
      Divide(number)
    end
  rescue
    print "Error: Divide by zero \n"
    Divide(number)
  end
end

def Instructions
  puts """
  Thank you for using my program!
  This 'Calculator' is an adding machine along with a regular calculator.

  For the main functions you can use the built in functions, or use the much easier manual funtions
  The manual syntax is as follows -

  MANUAL CALCUALTOR -

    X + Y | X+Y | X         +       Y| All these work.

  ADDING MACHINE -
    To end adding machine mode type 'end'

    Syntax -
      Current Number = 0
      Input: +3
      Current Number = 3
      Input: -3
      Current Number = 0
      Input *100
      Current Number = 0

  Press Enter to continue:
  """
  gets()
end

def AddingMachine
=begin
    Oh boy this one

    line 235 I start by splitting the user input
    line 241 Throw away becuase I need the position of the operator
    line 242-250 Goes through until it finds strings, and removes them
    line 252 Joins the numbers incase the number was more than 1 digit
    line 258 Makes the adding machine statement active to make sure you're not breaking things
    line 259-267 Finally finishes by doing the operation

=end
userNumber = 0
loop do
  userOperation = gets.chomp
  command = userOperation.split("")

  if userOperation.upcase == "END"
    break
  end

    x = 0
    for i in command
      if i.to_i.to_s == i
        next
      else
        operator = command[x]
        command.delete_at(x)
      end
      x += 1
    end

    result = [command.join()]

    result.insert(0, "Adding Machine")

    command = result

    if command.count == 2
        if operator == "+"
          userNumber = userNumber.to_f + command[1].to_f
        elsif operator == "-"
          userNumber = userNumber.to_f - command[1].to_f
        elsif operator == "*"
          userNumber = userNumber.to_f * command[1].to_f
        elsif operator == "/"
          userNumber = userNumber.to_f / command[1].to_f
        end
    end
    puts
    puts "Current number is: #{userNumber}"
  end
end

Init()
