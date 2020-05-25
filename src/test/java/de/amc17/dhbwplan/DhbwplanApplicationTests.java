package de.amc17.dhbwplan;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.context.annotation.PropertySource;

@SpringBootTest
@RunWith(SpringRunner.class)
@PropertySource("classpath:application-test.properties")
public class DhbwplanApplicationTests {

	@Test
	public void contextLoads() {
	}
	
}
