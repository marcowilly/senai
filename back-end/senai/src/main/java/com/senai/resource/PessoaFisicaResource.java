package com.senai.resource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.senai.service.PessoaFisicaService;
import com.senai.domain.PessoaFisica;

@RestController
@RequestMapping(value = "/pessoafisica")
public class PessoaFisicaResource {
	
	@Autowired
	private PessoaFisicaService service;
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<PessoaFisica> insert(@RequestBody PessoaFisica pessoa){
		pessoa =  service.insert(pessoa);
		return ResponseEntity.ok().body(pessoa);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<List<PessoaFisica>> findAll(){
		List<PessoaFisica> pessoas = service.findAll();
		return ResponseEntity.ok().body(pessoas);
	}
}
