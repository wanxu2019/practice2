package xjtu.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.transaction.TransactionConfiguration;

@ContextConfiguration(
        locations = {"classpath*:/applicationContext.xml",
                "classpath:**/applicationContext*.xml"})
@TransactionConfiguration(defaultRollback = false)
public abstract class BaseDaoTestCase extends AbstractTransactionalJUnit4SpringContextTests {
    @Autowired
    private SessionFactory sessionFactory;

    /**
     * Create a HibernateTemplate from the SessionFactory and call flush() and clear() on it.
     * Designed to be used after "save" methods in tests: http://issues.appfuse.org/browse/APF-178.
     *
     * @throws org.springframework.beans.BeansException
     *          when can't find 'sessionFactory' bean
     */
    protected void flush() throws BeansException {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.flush();
    }
}
