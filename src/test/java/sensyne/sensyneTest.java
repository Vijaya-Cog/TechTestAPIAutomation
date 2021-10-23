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
              //  .tags("@debug")
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
