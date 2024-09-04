package main

import "fmt"

func fib(n int) int {
	if n < 2 {
		return n
	}
	return fib(n-1) + fib(n-2)
}

func main() {
	x := fib(5)
	y := fib(7)
	fmt.Println("X: ", x)
	fmt.Println("Y: ", y)
}
