package examples.runners;

import com.intuit.karate.junit5.Karate;

public class ReqresRunner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:examples/features").relativeTo(getClass());
    }
}
