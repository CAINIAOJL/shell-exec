function myprint() 
{ 
  printf "%-16s - %s\n", $1, $4 
} 
function myrand(limit) 
{ 
  return int(limit * rand()) 
} 
function printthird() 
{ 
  print $3 
} 