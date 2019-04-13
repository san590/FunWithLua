math.randomseed(os.time())
local Number = {}
Number.__index = Number

function newLine()
  print()
end

function getRandomValue()
  return math.random(0, 9)
end

function Number.new()
  local self = setmetatable({}, Number)
  self.value = getRandomValue()
  return self
end

function Number.getValue(self)
  return self.value
end

function Number.printValue(self)
  io.write(self.value)
end

function Number.isEqual(self, value)
  if (self.value == tonumber(value)) then
    io.write("Liczby są takie same.")
    newLine()
    Number.printValue(self)
  else
    io.write("Liczby nie są takie same.")
    newLine()
    Number.printValue(self)
  end
end

function getInput()
  io.write("Podaj liczbę: ")
  liczba = io.read()
  return liczba
end

function sprawdzamCzyDziala()
  local i = Number.new()
  liczba = getInput()
  i:isEqual(liczba)
end

sprawdzamCzyDziala()