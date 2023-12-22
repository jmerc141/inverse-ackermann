

package main
import (
	"fmt"
	"os"
	"math/big"
)

var five = big.NewInt(5)
var one = big.NewInt(1)
var two = big.NewInt(2)

func inv(n big.Int) big.Int {
	if n.Cmp(five)==-1 {
		return n
	}
	
	a := inv(*(n.Sub(&n, big.NewInt(1))))
	b := inv(*(n.Sub(&n, big.NewInt(2))))

	r := a.Add(&a, &b)
	fmt.Println(r)
	return *r
}

func reg(n uint64) uint64 {
	if n<=4 {
		return n
	}

	a := reg(n-1)
	b := reg(n-2)

	return a+b
}

func main() {
	args := os.Args
	if len(args) == 2 {
		n := new(big.Int)
		n, ok := n.SetString(args[1], 10)
		if !ok {
			panic(ok)
		}
		//i := inv(*n)
		i := reg(n.Uint64())
		fmt.Println(i)
	}
}