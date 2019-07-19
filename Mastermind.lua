math.randomseed(os.time())
local Pin = {}
Pin.__index = Pin
charTab = {}
charTabSize = 0
codeTab = {}
codeSize = 0
upperCharTab = {}
upperCharTabSize = 0
givenTab = {}
givenSize = 0

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
  charTab[6] = 'b' --Black
  charTab[7] = 'g' --Green
  charTab[8] = 'o' --Orange
  charTabSize = #charTab
  upperCharTabSize = charTabSize
end

function setUpperCharTab()
  for i=1, upperCharTabSize do
    upperCharTab[i] = string.upper(charTab[i])
  end
end

function getRandomValue()
  var = math.random(1, 8)
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

function generateCode()
  firstPin = Pin:new()
  secondPin = Pin:new()
  thirdPin = Pin:new()
  fourthPin = Pin:new()
end

function showCode()
  firstPin:writeValue()
  secondPin:writeValue()
  thirdPin:writeValue()
  fourthPin:writeValue()
end

function createCode(var)
end
  

function check(var)
  for i=1, 8 do
    if(var == codeTab[i]) then
      return 1
    end
    
    if(i == 8) then
      return 0
    end
  end
end

function prepareGame()
  setCharTab()
  setUpperCharTab()
  generateCode()
end

function game()
  gcwp = 0 --good colour, wrong place
  gcgp = 0 --good colour, good place
  prepareGame()
  
end

game()