package com.base.test.Services;

import java.util.List;

import com.base.test.DTO.CriteriaDTO;
import com.base.test.model.Bill;

public interface ServiceInterface<T> {

	public List<T> getAll();

	public T findByID(Long id);

	public void create(T entity);

	public T delete(Long id);

	public T update(Long id, T entity);

	public default T getByName(String userName) {
		return null;
	}

	public default T getByTableNumber(String tableNumber) {
		return null;
	}
	
	public default List<T> getActiveBills() {
		return null;
	}
	
	public default List getByCriteria(Class searchClass, CriteriaDTO criteria) {
		return null;
	}

}
