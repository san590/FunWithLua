sign = '*'


function getInput()
  while(1) do
    io.write( "Podaj wysokosc drzewa: ") 
    height = io.read()
  
    if(tonumber(height) < 3) then
      os.execute("clear")
    else
      break end
  end
end

function printSpace() 
  io.write(" ")
end
  
function printSign()
  io.write(sign)
end
  
function newLine()
  print()
end

function drawCorona()
  width = (height - 1) * 2 + 1
  halfWidth = math.floor(width/2) + 1 

  for i=1, height do    
    for j=1, (halfWidth-i+1) do
      printSpace()
    end
  
    for k=(halfWidth-i+1), (halfWidth+i-1) do
      printSign()

      if(k == (halfWidth+i-1)) then
        newLine()
      end
    end

    if(i == width) then
      newLine()
    end    
  end
end

function drawTrunk()
  for i=height+1, height+math.floor(width/2) do
      for j=1, width do
        if(j == halfWidth + 1) then
          printSign()
        else printSpace() end

        if(j == width) then
          newLine()
        end
      end
  end
end

function drawTree()
  getInput()
  drawCorona()
  drawTrunk()
end

drawTree()