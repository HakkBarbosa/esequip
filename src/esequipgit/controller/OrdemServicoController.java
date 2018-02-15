package esequipgit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import esequipgit.daos.ClienteDAO;
import esequipgit.daos.EquipamentoDAO;
import esequipgit.daos.OrdemServicoDAO;
import esequipgit.models.Cliente;
import esequipgit.models.OrdemServico;

@Controller
public class OrdemServicoController  {
	
	@RequestMapping("ordens/form")
	public ModelAndView form(Cliente cliente){
		
		ClienteDAO clienteDAO = new ClienteDAO();
		cliente = clienteDAO.getById(cliente.getId());
		EquipamentoDAO equipamentoDAO = new EquipamentoDAO();
		
		ModelAndView modelAndView = new ModelAndView("ordens/form");
		modelAndView.addObject("cliente", cliente);
		modelAndView.addObject("equipamentos", equipamentoDAO.getLista(cliente));
		
		return modelAndView;
	}

	@RequestMapping(value="ordens", method=RequestMethod.POST)
	public String gravar(OrdemServico ordens) {
		OrdemServicoDAO dao = new OrdemServicoDAO();
		dao.inserir(ordens);
		
		return "ordens/adicionado";
	}
	
	
}
