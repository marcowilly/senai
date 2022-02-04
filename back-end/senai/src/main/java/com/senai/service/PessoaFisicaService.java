package com.senai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.senai.domain.PessoaFisica;
import com.senai.repository.PessoaFisicaRepository;

@Service
public class PessoaFisicaService {
	
	@Autowired(required = true)
	private PessoaFisicaRepository repo;
	
	public List<PessoaFisica> findAll(){
		return repo.findAll();
	}
	
	public PessoaFisica insert(PessoaFisica pessoa) {
		pessoa.setId(null);
		pessoa = repo.save(pessoa);
		return pessoa;
	}
}
