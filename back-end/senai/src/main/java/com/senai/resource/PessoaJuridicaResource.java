package com.senai.resource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.senai.service.PessoaJuridicaService;
import com.senai.domain.PessoaJuridica;

@RestController
@RequestMapping(value = "/pessoajuridica")
public class PessoaJuridicaResource {
	
	@Autowired
	private PessoaJuridicaService service;
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<PessoaJuridica> insert(@RequestBody PessoaJuridica pessoa){
		pessoa =  service.insert(pessoa);
		return ResponseEntity.ok().body(pessoa);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<List<PessoaJuridica>> findAll(){
		List<PessoaJuridica> pessoas = service.findAll();
		return ResponseEntity.ok().body(pessoas);
	}
}
