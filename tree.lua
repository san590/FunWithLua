while(1) do
    io.write( "Podaj wysokosc drzewa: ") 
    height = io.read()
  
    if(tonumber(height) < 3) then
      os.execute("clear")
    else
      break end
  end
  
  sign = '*'
  width = (height - 1) * 2 + 1
  halfWidth = math.floor(width/2) + 1
  print(halfWidth)
  
  function printSpace() 
    io.write(" ")
  end
  
  function printSign()
    io.write(sign)
  end
  
  function newLine()
    print()
  end
  
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