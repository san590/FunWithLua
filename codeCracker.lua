math.randomseed(os.time())
local Number = {}
Number.__index = Number

function space()
  io.write(" ")
end

function newLine()
  print()
end

function getRandomValue()
  return math.random(0, 9)
end

function Number.new()
  local self = setmetatable({}, Number)
  self.value = getRandomValue()
  self.shownValue = "_"
  return self
end

function Number.getValue(self)
  return self.value
end

function Number.writeValue(self)
  io.write(self.value)
end

function Number.replace(self)
  self.shownValue = self.shownValue:gsub("_", tostring(self.value))
end

function Number.isEqual(self, givenValue)
  isEqual = 0

  if (self.value == givenValue) then
    Number.replace(self)
    isEqual = 1
  end

  Number.show(self)
  
  return isEqual
end

function Number.show(self)
  io.write(self.shownValue)
  for i=1, 2 do
    space()
  end
end

function getInput()
  io.write("Podaj liczbę: ")
  liczba = io.read()
  return tonumber(liczba)
end

function showLives(lives)
  try = '+'
  tried = 'x'
  
  newLine()
  io.write("Życia: ")

  for i=1, 3-lives do
    io.write(tried)
  end
  
  for i=1, lives do
    io.write(try)
  end
end

firstNumber = Number.new()
secondNumber = Number.new()
thirdNumber = Number.new()
fourthNumber = Number.new()

function showCode()
  firstNumber:writeValue()
  secondNumber:writeValue()
  thirdNumber:writeValue()
  fourthNumber: writeValue()
end

function game()
  lives = 3

  print("CodeCracker")

  while true do
    liczba = getInput()
    isEqual = 0

    isEqual = isEqual + firstNumber:isEqual(liczba)
    isEqual = isEqual + secondNumber:isEqual(liczba)
    isEqual = isEqual + thirdNumber:isEqual(liczba)
    isEqual = isEqual + fourthNumber:isEqual(liczba)

    if(isEqual == 0) then
      lives = lives - 1
    end

    showLives(lives)

    if(lives == 0) then
      newLine()
      io.write("Kod, którego nie zgadłeś wynosi: ")
      showCode()
      break
    end

    newLine()
    newLine()
    
  end

end

game()