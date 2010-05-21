top = %w(
  R R R
  R R R
  R R R)
left = %w(
  B B B
  B B B
  B B B)
right = %w(
  W W W
  W W W
  W W W)
front = %w(
  O O O
  O O O
  O O O)
back = %w(
  G G G
  G G G
  G G G)
bottom = %w(
  Y Y Y
  Y Y Y
  Y Y Y)

cube = {:top => top,:left => left,:right => right,:front => front,:back => back,:bottom => bottom}


# (0..2).each {|row| puts a.slice(row,3).to_s}

def print_cube(cube)
# TODO fix this and iterate through cube to print each face
  cube.keys.each do |face|
   puts "== #{face} =="
   (0..2).each {|row| puts cube[face].slice(row*3,3).to_s}
  end 
end

def turn_left(cube, row)
  if row.eql? 1
    index = 0
  elsif row.eql? 3
    index = 6
  else
    raise 'ERROR: Not a valid row'
  end

  front = cube[:front].slice!(index,3) # slice first front row and store it
  left = cube[:left].slice!(index,3)# slice first left row and store it
  back = cube[:back].slice!(index,3)# slice first back row and store it
  right = cube[:right].slice!(index,3)# slice first right row and store it

  cube[:left].insert(index,*front)# insert front stored row into left
  cube[:back].insert(index,*left)# insert left stored row into back
  cube[:right].insert(index,*back)# insert back stored row into right
  cube[:front].insert(index,*right)# insert right stored row into front
end

def turn_right(cube, row)
  if row.eql? 1
    index = 0
  elsif row.eql? 3
    index = 6
  else
    raise 'ERROR: Not a valid row'
  end

  front = cube[:front].slice!(index,3)
  left = cube[:left].slice!(index,3)
  back = cube[:back].slice!(index,3)
  right = cube[:right].slice!(index,3)

  cube[:right].insert(index,*front)
  cube[:back].insert(index,*right)
  cube[:left].insert(index,*back)
  cube[:front].insert(index,*left)
end



# ONLY CALL THINGS BELOW

print_cube(cube)
turn_right(cube,3)
print_cube(cube)

