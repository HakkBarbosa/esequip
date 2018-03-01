package esequipgit.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import esequipgit.daos.ClienteDAO;
import esequipgit.daos.EquipamentoDAO;
import esequipgit.models.Cliente;
import esequipgit.models.Equipamento;

@Controller
public class EquipamentoController {

	@RequestMapping("equipamentos/form")
	public ModelAndView form(Cliente cliente) {
		ClienteDAO dao = new ClienteDAO();
		cliente = dao.getById(cliente.getId());
		
		ModelAndView modelAndView = new ModelAndView("equipamentos/form");
		modelAndView.addObject("cliente", cliente);
		
		return modelAndView;
	}
	
	@RequestMapping(value="equipamentos", method=RequestMethod.POST)
	public String gravar(Equipamento e){
		EquipamentoDAO dao = new EquipamentoDAO();
		dao.inserir(e);
		
		return "equipamentos/adicionado";
	} 

	@RequestMapping(value="equipamentos", method=RequestMethod.GET)
	public ModelAndView listar(Cliente cliente) {
		ClienteDAO dao = new ClienteDAO();
		cliente = dao.getById(cliente.getId());
		
		EquipamentoDAO equipamentoDAO = new EquipamentoDAO();
		List <Equipamento> equipamentos = equipamentoDAO.getLista(cliente);
		
		System.out.println(equipamentos.size());
		
		ModelAndView modelAndView = new ModelAndView("equipamentos/listar");
		modelAndView.addObject("equipamentos", equipamentos);
		modelAndView.addObject("cliente", cliente);
		
		return modelAndView;
	}
	
	@RequestMapping(value="equipamentos/remover")
	public String remover(Equipamento e) {
		EquipamentoDAO dao = new EquipamentoDAO();
		e = dao.getById(e.getId());
		dao.remover(e);
		
		return "redirect:/equipamentos?id="+e.getCliente().getId();
	}
	
	@RequestMapping(value="equipamentos/selecionar")
	public ModelAndView selecionar(Equipamento e) {
		EquipamentoDAO dao = new EquipamentoDAO();
		Equipamento equipamento = dao.getById(e.getId());
		
		ModelAndView modelAndView = new ModelAndView("equipamentos/form-alterar");
		modelAndView.addObject("equipamento", equipamento);
		
		return modelAndView;
	}
	
	@RequestMapping(value="equipamentos/alterar")
	public String alterar(Equipamento e) {
		EquipamentoDAO dao = new EquipamentoDAO();
		dao.alterar(e);
		
		return "redirect:/equipamentos?id="+e.getCliente().getId();
	}
}
