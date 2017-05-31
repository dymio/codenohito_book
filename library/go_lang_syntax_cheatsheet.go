package main

import (
  "fmt"
  "math/srand"
  "runtime"
)

// functions
func add(x, y int) int { return x + y }
func swap(x, y string) (string, string) { return y, x }
func addmult(x, y int) (a int, b int) {
  a = x + y
  b = x * y
  return
}

hypot := func(x, y float64) float64 {
  return math.Sqrt(x*x + y*y)
}
func compute(fn func(float64, float64) float64) float64 {
  return fn(3, 4)
}
x := compute(hypot)

func adder() func(int) int {
  sum := 0
  return func(x int) int {
    sum += x
    return sum
  }
}

func main() {
  // variables, constants and pointers
  var c, python, java bool
  var i, j int = 1, "no!"
  k := 3
  var (
    a bool = false
    b uint64 = 1<<64 - 1
  )
  const Pi = 3.14
  var p *int = i
  p := &i

  // types conversions
  var f float64 = float64(i)

  // for and if
  for i := 0; i < 10; i++ { sum += i }
  for sum < 1000 { sum += sum }
  if x < 0 { return sqrt(-x) + "i" }
  if v := math.Pow(x, n); v < lim {
    return v
  } else {
    fmt.Printf("%g >= %g\n", v, lim)
  }

  // switch
  switch os := runtime.GOOS; os {
  case "darwin":
    fmt.Println("OS X.")
  case "linux":
    fmt.Println("Linux.")
  default:
    fmt.Printf("%s.", os)
  }
  switch {
  case t.Hour() < 12:
    fmt.Println("Good morning!")
  case t.Hour() < 17:
    fmt.Println("Good afternoon.")
  default:
    fmt.Println("Good evening.")
  }

  // defer
  defer fmt.Println("world")

  // struct
  type Vertex struct {
    X int
    Y int
  }
  v := Vertex{1, 2}
  v := Vertex{X: 1, Y: 2}
  v.X = 4

  // array
  var a [10]int
  b := make([]int, 0, 5) // len(b)=0, cap(b)=5
  board := [][]string{
    []string{"_", "_", "_"},
    []string{"_", "_", "_"},
  }
  primes := [6]int{2, 3, 5, 7, 11, 13, 15}
  var s []int = primes[1:4]
  fmt.Printf("len=%d cap=%d %v\n", len(s), cap(s), s)
  if s == nil { fmt.Println("nil!") }
  s = append(s, 2, 3, 4)
  for _, value := range s {
    fmt.Printf("%d\n", value)
  }

  // maps
  var x map[string]int
  x = make(map[string]int)
  x["One"] = 1
  x["Two"] = 2
  var m = map[string]int{
    "Eleven": 11,
    "Twelwe": 12,
  }
  m["Twelwe"] = 13
  delete(m, "Twelwe")
  v, ok := m["Answer"]
  fmt.Println("The value:", v, "Present?", ok)

  fmt.Println("Hello, Ivan 世界")
}

// methods
func (v *Vertex) Abs() float64 {
  return math.Sqrt(v.X*v.X + v.Y*v.Y)
}
v := Vertex{3, 4}
fmt.Println(v.Abs())

// interfaces
type Abser interface {
  Abs() float64
}
var a Abser
a = &v
var i interface{} = "hello"
s, ok := i.(string)
switch v := i.(type) {
case int:
  fmt.Printf("Twice %v is %v\n", v, v*2)
case string:
  fmt.Printf("%q is %v bytes long\n", v, len(v))
default:
  fmt.Printf("I don't know about type %T!\n", v)
}
