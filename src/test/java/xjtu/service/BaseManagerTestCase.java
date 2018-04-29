package xjtu.service;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration(
        locations = {"classpath*:/applicationContext.xml",
                "classpath:**/applicationContext*.xml"})
public abstract class BaseManagerTestCase extends AbstractJUnit4SpringContextTests {
}
