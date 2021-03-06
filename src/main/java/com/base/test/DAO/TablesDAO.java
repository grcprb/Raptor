package com.base.test.DAO;

import org.springframework.stereotype.Repository;

import com.base.test.model.Tables;

@Repository("tablesDAO")
public class TablesDAO extends AbstractDao<Tables> {

	@Override
	public String getEntityName() {
		return "Tables";
	}

	@Override
	public Class getEntityClass() {
		return Tables.class;
	}

	public Tables getByTableNumber(String tableNumber) {
		return (Tables) getSession()
				.createQuery(
						"from " + getEntityName() + " where tableNumber = '" + tableNumber + "'")
				.uniqueResult();
	}
}
