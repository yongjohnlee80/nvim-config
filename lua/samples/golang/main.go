package main

import "fmt"

func add(a int, b int) int {
	result := a + b
	return result
}

func main() {
	a := 5
	b := 10

	c := add(a, b)
	fmt.Println("The result is ", c)
}
