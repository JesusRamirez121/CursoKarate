package example.runner;

import com.intuit.karate.junit5.Karate;

class AuthRunner {
    @Karate.Test
    Karate testByPath() {
        return Karate.run("classpath:examples/feature/authentication.feature");
    }
}
