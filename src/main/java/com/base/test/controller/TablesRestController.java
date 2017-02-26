package com.base.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.base.test.Services.ServiceInterface;
import com.base.test.model.Tables;

@RestController
@Configurable
public class TablesRestController extends AbstractRestController<Tables> {

	@Autowired
	private ServiceInterface<Tables> tablesService;

	@Override
	public ServiceInterface<Tables> getEntityService() {
		return tablesService;
	}

	@Override
	@GetMapping("/tablesAll")
	public List<Tables> getEntity() {
		return super.getEntity();
	}

	@Override
	@GetMapping("/tables/{id}")
	public ResponseEntity getEntityByID(@PathVariable("id") Long id) {
		return super.getEntityByID(id);
	}

	@Override
	@PostMapping(value = "/tables")
	public ResponseEntity createEntity(@RequestBody Tables tables) {
		return super.createEntity(tables);
	}

	@Override
	@DeleteMapping("/tables/{id}")
	public ResponseEntity deleteEntity(@PathVariable Long id) {
		return super.deleteEntity(id);
	}

	@Override
	@PutMapping("/tables/{id}")
	public ResponseEntity updateEntity(@PathVariable Long id, @RequestBody Tables tables) {
		return super.updateEntity(id, tables);
	}
}
