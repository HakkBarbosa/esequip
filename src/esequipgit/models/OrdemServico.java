package esequipgit.models;

import java.util.Calendar;

import org.springframework.format.annotation.DateTimeFormat;

public class OrdemServico {
	
	private Cliente cliente;
	private Equipamento equipamento;
	private Long id; 
	private String problema;
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Calendar dataSolicitacao;
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Calendar dataFinalizacao;
	
	public Cliente getCliente() { 
		return cliente;
	}
	
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	public Equipamento getEquipamento() { 
		return equipamento;
	}
	
	public void setEquipamento(Equipamento equipamento) {
		this.equipamento = equipamento;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getProblema() {
		return problema;
	}
	
	public void setProblema(String problema) {
		this.problema = problema;
	}
	
	public Calendar getDataSolicitacao() {
		return dataSolicitacao;
	}
	
	public void setDataSolicitacao(Calendar dataSolicitacao) {
		this.dataSolicitacao = dataSolicitacao;
	}
	
	public Calendar getDataFinalizacao() {
		return dataFinalizacao;
	}
	
	public void setDataFinalizacao(Calendar dataFinalizacao) {
		this.dataFinalizacao = dataFinalizacao;
	}

	@Override
	public String toString() {
		return "OrdemServico [cliente=" + cliente + ", equipamento=" + equipamento + ", id=" + id + ", problema="
				+ problema + ", dataSolicitacao=" + dataSolicitacao + ", dataFinalizacao=" + dataFinalizacao + "]";
	}
	
	
}