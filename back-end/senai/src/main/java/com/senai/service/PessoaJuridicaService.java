package com.senai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.senai.domain.PessoaJuridica;

import com.senai.repository.PessoaJuridicaRepository;

@Service
public class PessoaJuridicaService {
	
	@Autowired(required = true)
	private PessoaJuridicaRepository repo;
	
	public List<PessoaJuridica> findAll(){
		return repo.findAll();
	}
	
	public PessoaJuridica insert(PessoaJuridica pessoa) {
		pessoa.setId(null);
		pessoa = repo.save(pessoa);
		return pessoa;
	}
}
