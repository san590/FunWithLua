math.randomseed(os.time())
local Pin = {}
Pin.__index = Pin
charTab = {}

function space()
  io.write(" ")
end

function newLine()
  print()
end

function setTable()
  charTab[1] = 'w' --White
  charTab[2] = 'y' --Yellow
  charTab[3] = 'b' --Blue
  charTab[4] = 'r' --Red
  charTab[5] = 'p' --Pink
  charTab[6] = 'b' --Black
  charTab[7] = 'g' --Green
  charTab[8] = 'o' --Orange
end

function getRandomValue()
  var = math.random(1, 8)
  return charTab[var]
end

function Pin.new()
  local self = setmetatable({}, Pin)
  self.value = getRandomValue()
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

function game()
  setTable()
  generateCode()
  showCode()
end

game()


     