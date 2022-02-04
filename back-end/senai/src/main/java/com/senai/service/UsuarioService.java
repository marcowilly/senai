package com.senai.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.senai.domain.Usuario;
import com.senai.repository.UsuarioRepository;

@Service
public class UsuarioService {
	
	@Autowired(required = true)
	private UsuarioRepository repo;
	
	public Usuario find(Usuario usuario){
		Optional<Usuario> obj = Optional.of(repo.findByNome(usuario.getNome()));
		return obj.orElse(null);
	}
}
