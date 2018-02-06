package esequipgit.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import esequipgit.daos.ClienteDAO;
import esequipgit.models.Cliente;

@Controller
public class ClienteController {
	// Comandos referentes a um cliente

	@RequestMapping("clientes/form")
	public String form() {
		return "clientes/form";
	}

	@RequestMapping(value = "clientes", method = RequestMethod.POST)
	public String gravar(Cliente c) {
		ClienteDAO dao = new ClienteDAO();
		dao.inserir(c);

		return "clientes/adicionado";
	}

	@RequestMapping(value = "clientes", method = RequestMethod.GET)
	public ModelAndView listar() {
		ClienteDAO dao = new ClienteDAO();
		List<Cliente> clientes = dao.getLista();

		ModelAndView modelAndView = new ModelAndView("clientes/listar");
		modelAndView.addObject("clientes", clientes);
		return modelAndView;
	}

	@RequestMapping(value = "clientes/remover")
	public String remover(Cliente c) {
		ClienteDAO dao = new ClienteDAO();
		dao.remover(c);

		return "redirect:/clientes";
	}

	@RequestMapping(value = "clientes/selecionar")
	public ModelAndView selecionar(Cliente c) {
		ClienteDAO dao = new ClienteDAO();
		Cliente cliente = dao.getById(c.getId());

		ModelAndView modelAndView = new ModelAndView("clientes/form-alterar");
		modelAndView.addObject("cliente", cliente);

		return modelAndView;
	}

	@RequestMapping(value = "clientes/alterar")
	public ModelAndView alterar(Cliente c) {
		ClienteDAO dao = new ClienteDAO();
		dao.alterar(c);

		return listar();
	}
}
