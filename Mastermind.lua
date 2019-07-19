math.randomseed(os.time())
local Pin = {}
Pin.__index = Pin

local MyPin = {}
MyPin.__index = MyPin

charTab = {}
charTabSize = 0
codeTab = {}
codeSize = 0

myCodeTab = {}
myCodeSize = 0
countTab = {0, 0, 0, 0, 0, 0, 0, 0}

function space()
  io.write(" ")
end

function newLine()
  print()
end

function setCharTab()
  charTab[1] = 'w' --White
  charTab[2] = 'y' --Yellow
  charTab[3] = 'b' --Blue
  charTab[4] = 'r' --Red
  charTab[5] = 'p' --Pink
  charTab[6] = 'l' --bLack
  charTab[7] = 'g' --Green
  charTab[8] = 'o' --Orange
  charTabSize = #charTab
end

function getRandomValue()
  var = math.random(1, charTabSize)
  return charTab[var]
end

function Pin.new()
  local self = setmetatable({}, Pin)
  self.value = getRandomValue()
  codeSize = codeSize + 1
  codeTab[codeSize] = self.value
  return self
end

function Pin.getValue(self)
  return self.value
end

function Pin.writeValue(self)
  io.write(self.value)
end


function MyPin.new()
  local self = setmetatable({}, MyPin)
  self.value = '-'
  return self
end

function MyPin.setValue(self, value)
  self.value = value
end

function MyPin.writeValue(self)
  io.write(self.value)
end

function MyPin.getValue(self)
  return self.value
end

function checkInput(var)
  for i=1, charTabSize do
    if(var == charTab[i] or var == string.upper(charTab[i])) then
      return 1
    end
    
    if(i == 8) then
      return 0
    end
  end
end

function showMyCode()
  firstMyPin:writeValue()
  secondMyPin:writeValue()
  thirdMyPin:writeValue()
  fourthMyPin:writeValue()
end

function MyPin.getInput(self)
  while true do
    io.write("Kolory: White, Yellow, Blue, Red, Pink, bLack, Green, Orange. Wyr�niona litera s�u�y do wprowadzenia koloru.")
    newLine()
    io.write("Kolor: ")
    kolor = io.read()
    var = checkInput(kolor)
    if(var == 1) then
      break
    end
    os.execute("clear")
  end
  iter = iter + 1

  MyPin.setValue(self, kolor)

  io.write("Wprowadzony kod: ")
  showMyCode()
  io.read()
  if iter < 5 then 
    os.execute("clear")
  end
  
  if iter == 4 then
    iter = 0
  end

  myCodeTab[myCodeSize] = MyPin.getValue(self)
  myCodeSize = myCodeSize + 1
end

function count(var)
  for i=1, codeSize do
    if var == codeTab[i] then
      countTab[i] = countTab[i] + 1
    end
  end
end

function generateCode()

  firstPin = Pin:new()
  secondPin = Pin:new()
  thirdPin = Pin:new()
  fourthPin = Pin:new()


  count('w')
  count('y')
  count('b')
  count('r')
  count('p')
  count('l')
  count('g')
  count('o')

end

function createAnswer()
  firstMyPin = MyPin:new()
  secondMyPin = MyPin:new()
  thirdMyPin = MyPin:new()
  fourthMyPin = MyPin:new()
end

function generateAnswer()
  firstMyPin:getInput()
  secondMyPin:getInput()
  thirdMyPin:getInput()
  fourthMyPin:getInput()

end

function showCode()
  firstPin:writeValue()
  secondPin:writeValue()
  thirdPin:writeValue()
  fourthPin:writeValue()
end


function showAnswer()
  firstMyPin:writeValue()
  secondMyPin:writeValue()
  thirdMyPin:writeValue()
  fourthMyPin:writeValue()
end

function myCodeRefresh()
  firstMyPin:setValue("-")
  secondMyPin:setValue("-")
  thirdMyPin:setValue("-")
  fourthMyPin:setValue("-")
end

function checkCode()
  gcgp = 0
  gcwp = 0
  for i=1, codeSize do
    if codeTab[i] == myCodeTab[i] then
      gcgp = gcgp + 1
    end
  end


end


function prepareGame()
  setCharTab()
  createCode()
  createAnswer()
end

function game()
  
  prepareGame()

  for i=1, 30 do
    if myCodeSize > 4 then
      myCodeSize = 1
    end
    gcwp = 0 --good colour, wrong place
    gcgp = 0 --good colour, good place
    iter = 0
    generateAnswer()
    checkCode()

    io.write("Dobry kolor, z�e miejsce: " .. gcwp)
    newLine()
    io.write("Dobry kolor, dobre miejsce: " .. gcgp)
    newLine()
    io.write("Tw�j kod: ")
    showAnswer()
    newLine()
    io.write("Szukany kod: ")
    showCode()
    io.read()
    os.execute("clear")
    io.write("Pozosta�o " .. 30 - i .. " pr�b")
    myCodeRefresh()
    newLine()
    io.read()

    os.execute("clear")
    
  end
  
end

game()

