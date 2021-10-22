package sensyne;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class sensyneTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:sensyne")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run("tags").tags("@debug").relativeTo(getClass());
    }


}
