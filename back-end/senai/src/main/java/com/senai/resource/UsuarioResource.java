package com.senai.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.senai.service.UsuarioService;

import com.senai.domain.Usuario;

@RestController
@RequestMapping(value = "/usuario")
public class UsuarioResource {
	
	@Autowired
	private UsuarioService service;
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Usuario> find(@RequestBody Usuario usuario){
		Usuario bUsuario =  service.find(usuario);
		return ResponseEntity.ok().body(bUsuario);
	}
}
