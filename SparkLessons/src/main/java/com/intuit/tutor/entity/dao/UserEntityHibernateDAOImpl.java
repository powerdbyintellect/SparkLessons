package com.intuit.tutor.entity.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.intuit.tutor.entity.UserEntity;

@Transactional
@Repository
public class UserEntityHibernateDAOImpl implements UserEntityDAO {

	private Session session;
    private SessionFactory sessionFactory;
	
	/**
     * Set the session factory to be used.
     *
     * @param sessionFactory
     *            The session factory to be used by this DAO.
     */
    @Autowired(required = true)
    public void setSessionFactory(final SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * Returns the associated session factory.
     *
     * @return an session factory
     */
    protected SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            throw new IllegalStateException("SessionFactory has not been set on DAO before usage");
        }
        return sessionFactory;
    }

    /**
     * Returns the current session.
     *
     * @return a session
     */
    protected Session getSession() {
        session = getSessionFactory().getCurrentSession();
        return session;
    }
	@Override
	public UserEntity getUser(String emailAddress) {
		Query query = getSession().createQuery("from UserEntity where email = :email");
		query.setParameter("email", emailAddress);
		List<UserEntity> list = query.list();
		if(list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
		
	}

	@Override
	public UserEntity saveUser(UserEntity user) {
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
		return user;

	}

}
