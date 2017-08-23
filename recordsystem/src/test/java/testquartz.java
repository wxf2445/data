import org.quartz.CronExpression;

/**
 * Created by ZJUXP on 2016-09-21.
 */
public class testquartz {
    public static void main(String[] args) {
        System.out.println(CronExpression.isValidExpression("0 0 1 ? * 1"));

    }
}
