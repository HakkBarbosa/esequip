package esequipgit.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import esequipgit.daos.ClienteDAO;
import esequipgit.daos.EquipamentoDAO;
import esequipgit.daos.OrdemServicoDAO;
import esequipgit.models.Cliente;
import esequipgit.models.Equipamento;
import esequipgit.models.OrdemServico;

@Controller
public class OrdemServicoController  {
	
	@RequestMapping("ordens/form")
	public ModelAndView form(Cliente cliente){
		
		System.out.println(cliente.getId());
		
		ClienteDAO clienteDAO = new ClienteDAO();
		cliente = clienteDAO.getById(cliente.getId());
		EquipamentoDAO equipamentoDAO = new EquipamentoDAO();
		
		System.out.println(cliente);
		System.out.println(cliente.getId());
		List<Equipamento> equipamentos = equipamentoDAO.getLista(cliente);
		
		ModelAndView modelAndView = new ModelAndView("ordens/form");
		modelAndView.addObject("cliente", cliente);
		modelAndView.addObject("equipamentos", equipamentoDAO.getLista(cliente));
		
		return modelAndView;
	}

	@RequestMapping(value="ordens", method=RequestMethod.POST)
	public String gravar(OrdemServico ordem) {
		
//		ordem.setDataSolicitacao(Calendar.getInstance());
		System.out.println("Ordem de Serviço: " + ordem);
		OrdemServicoDAO dao = new OrdemServicoDAO();
		dao.inserir(ordem);
		
		return "ordens/adicionado";
	}
	
	
	@RequestMapping(value="ordens", method=RequestMethod.GET)
	public ModelAndView listar() {
		OrdemServicoDAO dao_listar = new OrdemServicoDAO();
		List <OrdemServico> ordens = dao_listar.getLista();
		
		EquipamentoDAO equipamentoDAO = new EquipamentoDAO();
		ClienteDAO clienteDAO = new ClienteDAO();
		
		for(OrdemServico os : ordens){
			Cliente cliente = clienteDAO.getById(os.getCliente().getId());
			os.setCliente(cliente);
			Equipamento equipamento = equipamentoDAO.getById(os.getEquipamento().getId());
			os.setEquipamento(equipamento);
		}
		
		ModelAndView modelAndView = new ModelAndView("ordens/listar");
		modelAndView.addObject("ordens", ordens);
		
		return modelAndView;
	}
	
	@RequestMapping(value="ordens/finalizar")
	public ModelAndView finalizar(OrdemServico ordemServico){
		OrdemServicoDAO ordemServicoDAO = new OrdemServicoDAO();
		ordemServico = ordemServicoDAO.getById(ordemServico.getId());
		
		ordemServicoDAO.finalizar(ordemServico);
		
		ModelAndView modelAndView = new ModelAndView("redirect:../ordens");
		
		return modelAndView;
	}
}
