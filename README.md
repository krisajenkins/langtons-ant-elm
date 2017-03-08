# Langton's Ant Example Project

## Algorithm

Squares on a plane are colored variously either black or white. We
arbitrarily identify one square as the "ant". The ant can travel in
any of the four cardinal directions at each step it takes. The "ant"
moves according to the rules below:

* At a white square, turn 90° right, flip the color of the square, move forward one unit
* At a black square, turn 90° left, flip the color of the square, move forward one unit

- https://en.wikipedia.org/wiki/Langton's_ant

## Building

``` sh
make -w
```

Files are built into dist. 

## Viewing

``` sh
( cd dist ; python -m SimpleHTTPServer 7000 )
```

...and browse to http://localhost:7000/
