def Init
  history = 0
  Prompt(history)
end

def Prompt(history)
  puts "You may begin - "
  input = gets.chomp
  Assigner(input,history)
end

def Assigner(input,history)
  if input.to_i == 01
    firstNumber = history
  else
    firstNumber = FirstNumber(input)
  end

  operator = Operator(input)
  secondNumber = SecondNumber(input)

  puts "Operator is #{operator}, First number is #{firstNumber}, Last number is #{secondNumber}"

  puts Operation(firstNumber, operator, secondNumber)
  history = Operation(firstNumber, operator, secondNumber)
  Prompt(history)
end

def Operator(find)
  find = find.split("")
  x = 0
  for i in find
    if i == " "
      x+=1
      next
    elsif i.to_i.to_s != i and i != " "
      operator = find[x]
      return operator
    else
      x+=1
      next
    end
  end
end

def FirstNumber(find)
  find = find.split("")
  catch = false
  x = -1
  for i in find
    x += 1
    if i == " " or i.to_i.to_s != i and catch == false
      catch = true
      start = x
    end
    if catch == true
      stop = x
    end
  end
  until stop == start
    find.pop()
    stop -= 1
  end
  for i in find
    if i.to_i.to_s != i
      find.pop
    end
  end
  return find.join.strip
end

def SecondNumber(find)
  find = find.strip()
  find = find.split("")
  for i in find
    if i == " "
      next
    elsif i.to_i.to_s != i
      find = find.drop(find.index(i) + 1)
      return find.join.strip
    else
      next
    end
  end
end

def Operation(first, operator, last)

  if operator == "+"
    return first.to_f + last.to_f
  elsif operator == "-"
    return first.to_f = last.to_f
  elsif operator == "*"
    return first.to_f * last.to_f
  elsif operator == "/"
    return first.to_f / last.to_f
  else
    puts "Command not recognized"
  end
end

Init()
