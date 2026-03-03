package example.runner;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    @Karate.Test
    Karate testByPath() {
        return Karate.run("classpath:examples/feature/pets.feature");
    }
}
