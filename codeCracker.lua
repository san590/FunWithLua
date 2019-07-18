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

function Number.printValue(self)
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
  print("CodeCracker")
  io.write("Podaj liczbê: ")
  liczba = io.read()
  os.execute("clear")
  print("CodeCracker")
  io.write("Podano liczbê: " .. liczba)
  newLine()
  return tonumber(liczba)
end

function showLives(lives)
  try = '+'
  tried = 'x'
  
  newLine()
  if(lives > 0) then
    io.write("Pozosta³a iloœæ ¿yæ: ")

    for i=1, lives do
      io.write(try)
    end

    for i=1, 3-lives do
      io.write(tried)
    end
  end
end

function core(liczba)
  isEqual = 0

  isEqual = isEqual + firstNumber:isEqual(liczba)
  isEqual = isEqual + secondNumber:isEqual(liczba)
  isEqual = isEqual + thirdNumber:isEqual(liczba)
  isEqual = isEqual + fourthNumber:isEqual(liczba)

  if(isEqual == 0 and lives > 0) then
    lives = lives - 1
  end
end

function generateCode()
  firstNumber = Number:new()
  secondNumber = Number:new()
  thirdNumber = Number:new()
  fourthNumber = Number:new()
end

function showCode()
  firstNumber:show()
  secondNumber:show()
  thirdNumber:show()
  fourthNumber:show()
end

function showAnswer()
  firstNumber:replace()
  secondNumber:replace()
  thirdNumber:replace()
  fourthNumber:replace()

  io.write("Kod, który nie zosta³ zgadniêty to:")
  firstNumber:show()
  secondNumber:show()
  thirdNumber:show()
  fourthNumber:show()
end

function showGame()
  getInput()
end
 numTab = {}
function game()
  generateCode()
  lives = 3

 
  tabIndex = 1
  isInTab = 0

  while true do
   
    liczba = getInput()
    isInTab = 0

    for i=1, tabIndex do
      if(liczba == numTab[i]) then
        isInTab = 1
        break
      elseif (i == tabIndex) then
        numTab[tabIndex] = liczba
        tabIndex = tabIndex + 1
      end
    end
    
    if(isInTab == 0) then
      core(liczba)
    end
    showLives(lives)
    newLine()
    io.write("Wykorzystane liczby to: ")
    for i=1, tabIndex-1 do
      io.write(tostring(numTab[i]))
      space()
    end

    if(lives == 0) then
      os.execute("clear")
      showAnswer()
      break
    end
  end
end

game()