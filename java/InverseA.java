/*
 * if n=<50 use int
 */
import java.math.BigInteger;
public class InverseA {
    public static BigInteger inverseAckermann(BigInteger n)
    {

        // Check if the input is small enough
        // to solve directly
        if (n.compareTo(BigInteger.valueOf(5)) == -1) {
            return n;
        }

        // Divide the problem into
        // two smaller problems
        BigInteger a = inverseAckermann(n.subtract(BigInteger.ONE));
        BigInteger b = inverseAckermann(n.subtract(BigInteger.valueOf(2)));

        // Combine the solutions of the
        // two smaller problems
        return a.add(b);
    }

    // Driver Code
    public static void main(String[] args)
    {
        if(args.length == 1){
            BigInteger n, A;
            n = new BigInteger(args[0]);
            A = inverseAckermann(n);

            System.out.println("Result: " + A);
        }
        else {
            System.out.println("Need 2 arguments");
        }
    }
}
