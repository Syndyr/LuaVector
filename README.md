# LuaVector
A universal vector library verified compatible with all major Lua versions and does not require any services like LuaRocks or external libraries.

This library is intended to be used for 2D applications primarily but the Vector metatype supports 3D math, this includes all mathematical operands and boolean operators.


## Implementation
Implementation is as simple as requiring the library.

In this example the library is located in a "libs" file in the project root directory.

```
require "libs.vector"
```

## Vector creation
You can create a Vector using both a long and short function in the following manners.
All vectors are created with three axis entries, x, y and z, by default these values are 0 unless stated otherwise during creation.

```
myVector = Vector() --The same as doing Vector(0, 0, 0)
myShortVector = v() --The same as doing v(0, 0, 0)
```


## Vector math and comparisons

Vectors can be manipulated like a normal number with no need for special considerations. This includes adding/subtracting/multiplying/dividing/modding/power Vectors together.

You can also add/subtract/multiply/divide/modulo/power a Vector with a normal number.
```
myVector = Vector(2, 2, 2) + Vector(1, 1, 1) --> [3, 3, 3]
myVector = Vector(2, 2, 2) - Vector(1, 1, 1) --> [1, 1, 1]
myVector = Vector(2, 2, 2) * Vector(2, 2, 2) --> [4, 4, 4]
myVector = Vector(2, 2, 2) / Vector(2, 2, 2) --> [1, 1, 1]
myVector = Vector(7, 8, 11) % Vector(3, 5, 6) --> [1, 3, 5]
myVector = Vector(2, 2, 2) ^ Vector(2, 3, 4) --> [4, 8, 16]


myVector = Vector(2, 2, 2) + 1 --> [3, 3, 3]
myVector = Vector(2, 2, 2) - 1 --> [1, 1, 1]
myVector = Vector(2, 2, 2) * 2 --> [4, 4, 4]
myVector = Vector(2, 2, 2) / 2 --> [1, 1, 1]
myVector = Vector(7, 8, 11) % 3 --> [1, 2, 2]
myVector = Vector(2, 2, 2) ^ 4 --> [16, 16, 16]
```

Vectors can be compared against each other as well and requires all digits to meet the comparison criteria.

## Other functions
This is a list of various utility and "nice to have" functions included in this library.

### self[Vector]:dist(target[Vector])
This is a function for getting the distance between two points in space and is the only supplied function that uses all three axis available.
##### Returns
- Distance[Number]
- Delta[Vector]

Distance is the linear distance between points.

Delta is the cartesian delta between x1 -> x2, y1 -> y2 and z1 -> z2.



### self[Vector]:inBounds2D(bottomRight[Vector], point[Vector])

This allows for a crude and quick 2D bounds check, it will check that point[Vector] is within the points defined by self[Vector] and bottomRight[Vector].

##### Returns
- inBounds[Boolean]

Inbounds states if point[Vector] is within the bounds of self[Vector] and bottomRight[Vector].



### self[Vector]:bearing2D(target[Vector])
This does a quick calculation to find the bearing between self[Vector] and target[Vector]. 

##### Returns
- Bearing[number]
- Distance[Number]
- Delta[Vector]

Bearing is the bearing between self[Vector] and target[Vector].

Distance is the linear distance between points.

Delta is the cartesian delta between x1 -> x2, y1 -> y2 and z1 -> z2.

### self[Vector]:tangent2D(target[Vector], distance[Number])
It does what it says. I'm not too sure how, I was mildly intoxicate when I wrote this.





### self[Vector]:toString(round[Boolean])
Formats the x, y and z to a human readable format.

##### Returns
- String[String]

### self[Vector]:splitxyz(round[Boolean])
Splits and returns self[Vector]'s x, y and z components as numbers.

##### returns
- X[Number]
- Y[Number]
- Z[Number]

### self[Vector]:x/y/z(set[Number])
Operates as separate get/set functions for the axis they denote.







