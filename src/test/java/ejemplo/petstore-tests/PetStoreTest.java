package ejemplo.petstore;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

class PetStoreTest {
    
    @Test
    Karate testAll() {
        return Karate.run("classpath:petstore.feature");
    }    
}