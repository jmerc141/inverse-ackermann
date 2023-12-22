
function inv(n){
    if(n<=4){
        return n;
    }

    let a=inv(n-1n);
    let b=inv(n-2n);

    return a+b
}

var args = process.argv.slice(1);
//var start = Date.now();
console.log(inv(BigInt(args[1])));
//var end = (Date.now() - start) / 1000;
// console.log("\n" + end + "s");