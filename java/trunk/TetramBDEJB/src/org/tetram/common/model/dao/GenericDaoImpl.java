package org.tetram.common.model.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;

public class GenericDaoImpl<T, ID extends Serializable> implements
		GenericDao<T, ID> {

	protected Session session = null;

	private Class<T> persistentClass;

	@SuppressWarnings("unchecked")
	public GenericDaoImpl() {
		this.persistentClass = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	@SuppressWarnings("unchecked")
	public T findById(ID id) {
		T entity = (T) getSession().load(persistentClass, id);

		return entity;
	}

	public List<T> findAll() {
		return findByCriteria();
	}

	public T makePersistent(T entity) {
		getSession().saveOrUpdate(entity);
		return entity;
	}

	public void makeTransient(T entity) {
		getSession().delete(entity);
	}

	public void refresh(T entity) {
		this.session.flush();
		this.session.refresh(entity);
	}

	@SuppressWarnings("unchecked")
	protected List<T> findByCriteria(Criterion... criterion) {
		Criteria criteria = getSession().createCriteria(persistentClass);
		for (Criterion c : criterion) {
			criteria.add(c);
		}
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	protected List<T> findByCriteria(DetachedCriteria criteria) {
		return criteria.getExecutableCriteria(getSession()).list();
	}

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

}
