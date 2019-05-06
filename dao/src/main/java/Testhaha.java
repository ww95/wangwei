import org.testng.annotations.Test;

import java.math.BigInteger;

public class Testhaha {
    @Test
    public void test(){
        BigInteger bigInteger1 = new BigInteger("19");
        BigInteger bigInteger2 = new BigInteger("198949");
        System.out.println(bigInteger1.multiply(bigInteger2));
    }
}
