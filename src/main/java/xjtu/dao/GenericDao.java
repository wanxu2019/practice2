package xjtu.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

public class GenericDao<T> {
    public static final int DATABASE_MYSQL_1 = 1;
    public static final int DATABASE_MYSQL_2 = 2;

    @Autowired
    @Resource(name = "sessionFactory")
    private SessionFactory mysql1SessionFactory;

    //@Autowired
    //@Resource(name = "mysql2SessionFactory")
    private SessionFactory mysql2SessionFactory;


    /**
     * 对外提供的Session接口1
     * 根据databaseId获取Session
     * @param databaseId 数据库ID，从Dao类的静态常量获取
     * @return 根据相应数据库建立的session对象
     */
    public Session getSession(int databaseId) {
        switch (databaseId) {
            case DATABASE_MYSQL_1:
                return getSessionFromMysql1();
            case DATABASE_MYSQL_2:
                return getSessionFromMysql2();
            default:
                break;
        }
        return null;
    }
    /**
     * 对外提供的Session接口2
     * 获取默认Session
     * @return 根据相应数据库建立的session对象
     */
    public Session getSession() {
        return getSessionFromMysql1();
    }

    private Session getSessionFromMysql1() throws HibernateException {
        Session sess = getMysql1SessionFactory().getCurrentSession();
        if (sess == null) {
            sess = getMysql1SessionFactory().openSession();
        }
        return sess;
    }

    private Session getSessionFromMysql2() throws HibernateException {
        Session sess;
        try {
            sess = getMysql2SessionFactory().getCurrentSession();
            if (sess == null) {
                sess = getMysql2SessionFactory().openSession();
            }
        } catch (HibernateException e) {
            sess = getMysql2SessionFactory().openSession();
        }
        return sess;
    }


    //Spring注入方法
    public SessionFactory getMysql1SessionFactory() {
        return this.mysql1SessionFactory;
    }

    public void setMysql1SessionFactory(SessionFactory mysql1SessionFactory) {
        this.mysql1SessionFactory = mysql1SessionFactory;
    }


    public SessionFactory getMysql2SessionFactory() {
        return mysql2SessionFactory;
    }

    public void setMysql2SessionFactory(SessionFactory mysql2SessionFactory) {
        this.mysql2SessionFactory = mysql2SessionFactory;
    }

    //todo：待增加事务处理
    public void add(T entity, int databaseId) {
        getSession(databaseId).beginTransaction();
        getSession(databaseId).save(entity);
        getSession(databaseId).getTransaction().commit();
        getSession(databaseId).flush();
    }

    public void delete(T entity, int databaseId) {
        if (entity == null) {
            System.out.printf("GenericDao.delete: %s\n", "数据库中没有要删除的对象");
            return;
        }
        getSession(databaseId).beginTransaction();
        getSession(databaseId).delete(entity);
        getSession(databaseId).getTransaction().commit();
		getSession(databaseId).flush();
    }

    public void deleteById(Class<T> clz, Serializable id, int databaseId) {
        System.out.println(id);
        T entity = get(clz, id, databaseId);
        if (entity == null) {
            System.out.printf("GenericDao.delete: %s\n", "数据库中没有要删除的对象");
            return;
        }
        getSession(databaseId).beginTransaction();
        getSession(databaseId).delete(entity);
        getSession(databaseId).getTransaction().commit();
		getSession(databaseId).flush();
    }

    public void deleteByUserId(Class<T> clz, int userId, int databaseId) {
        Query query = getSession(databaseId).createQuery("from " + clz.getName() + " bean where bean.userId=?");
        query.setInteger(0, userId);
        List<T> list = query.list();
        getSession(databaseId).beginTransaction();
        for (int i = 0; i < list.size(); i++) {
            T bean = list.get(i);
            getSession(databaseId).delete(bean);
        }
        getSession(databaseId).getTransaction().commit();
		getSession().flush();
    }

    /**
     * 通过id获得实例
     *
     * @param clz
     * @param id
     * @return
     */
    @SuppressWarnings("unchecked")
    public T get(Class<T> clz, Serializable id, int databaseId) {
        getSession(databaseId).beginTransaction();
        T entity = (T) getSession(databaseId).get(clz, id);
        getSession(databaseId).getTransaction().commit();
        return entity;
    }

    public void update(T entity, int databaseId) {
        getSession(databaseId).beginTransaction();
        getSession(databaseId).update(entity);
        getSession(databaseId).getTransaction().commit();
		getSession(databaseId).flush();
    }

    @SuppressWarnings("unchecked")
    public List<T> list(Class<T> clz, int databaseId) {
        getSession(databaseId).beginTransaction();
        List<T> list = (List<T>) getSession(databaseId).createQuery("from " + clz.getName()).list();
        getSession(databaseId).getTransaction().commit();
		getSession().flush();
        return list;
    }

    /**
     * hql
     *
     * @param q
     * @return
     */
    @SuppressWarnings("rawtypes")
    public List getlist(Query q) {
        return q.list();
    }

    /**
     * 为了得到session创建的query
     *
     * @param hql
     * @return
     */
    public Query createQuery(String hql, int databaseId) {
        return getSession(databaseId).createQuery(hql);
    }

    public void close(int databaseId) {
        Session session = getSession(databaseId);
        if (session != null) {
            session.close();
            session = null;
        }
    }

    public void add(T entity) {
        getSession().beginTransaction();
        getSession().save(entity);
        getSession().getTransaction().commit();
        getSession().flush();
    }

    public void delete(T entity) {
        if(entity == null) {
            System.out.printf("GenericDao.delete: %s\n", "数据库中没有要删除的对象");
            return;
        }
        getSession().beginTransaction();
        getSession().delete(entity);
        getSession().getTransaction().commit();
		getSession().flush();
    }

    public void deleteById(Class<T> clz, Serializable id) {
        System.out.println(id);
        T entity = get(clz, id);
        if(entity == null) {
            System.out.printf("GenericDao.delete: %s\n", "数据库中没有要删除的对象");
            return;
        }
        getSession().beginTransaction();
        getSession().delete(entity);
        getSession().getTransaction().commit();
		getSession().flush();
    }
    public void deleteByUserId(Class<T> clz,int userId){
        Query query=getSession().createQuery("from "+clz.getName()+" bean where bean.userId=?");
        query.setInteger(0,userId);
        List<T> list=query.list();
        getSession().beginTransaction();
        for(int i=0;i<list.size();i++)
        {
            T bean=list.get(i);
            getSession().delete(bean);
        }
        getSession().getTransaction().commit();
		getSession().flush();
    }

    /**
     * 通过id获得实例
     * @param clz
     * @param id
     * @return
     */
    @SuppressWarnings("unchecked")
    public T get(Class<T> clz, Serializable id) {
        //getSession().beginTransaction();
        T entity = (T) getSession().get(clz, id);
        //getSession().getTransaction().commit();
        return entity;
    }

    public void update(T entity) {
        getSession().beginTransaction();
        getSession().update(entity);
        getSession().getTransaction().commit();
		getSession().flush();
    }

    @SuppressWarnings("unchecked")
    public List<T> list(Class<T> clz) {
        getSession().beginTransaction();
        List<T> list=(List<T>)getSession().createQuery("from " + clz.getName()).list();
        getSession().getTransaction().commit();
		getSession().flush();
        return list;
    }

    /**
     * 为了得到session创建的query
     * @param hql
     * @return
     */
    public Query createQuery(String hql) {
        return getSession().createQuery(hql);
    }
    public void close(){
        Session session=getSession();
        if(session!=null)
        {
            session.close();
            session=null;
        }
    }
}
