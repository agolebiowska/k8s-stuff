package main

import (
	"fmt"
	"time"
)

func main() {
	for {
		fmt.Println("Hello, there.")
		time.Sleep(time.Second * 1)
	}
}
