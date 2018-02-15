package esequipgit.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import esequipgit.models.OrdemServico;

public class OrdemServicoDAO {

	private Connection connection;
	
	public OrdemServicoDAO() {
		connection = ConnectionFactory.getConnection();
	}
	
	public boolean inserir (OrdemServico ordemServico) {
		String sql = "insert into ordemServico (problema, dataSolicitacao)" + "values (?, ?);";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, ordemServico.getProblema());
			stmt.setDate(2, new java.sql.Date(ordemServico.getDataSolicitacao().getTimeInMillis()));
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public List <OrdemServico> getLista() {
		List<OrdemServico> result = new ArrayList<>();
		
		try {
			PreparedStatement stmt = this.connection.prepareStatement("seletc * from ordemServico");
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				//Criando o objeto Ordem de Servico
				OrdemServico ordemServico = new OrdemServico ();
				ordemServico.setId(rs.getLong("id"));
				ordemServico.setProblema(rs.getString("problema"));
				
				//Montando as datas através do Calendar
				Calendar dataS = Calendar.getInstance();
				dataS.setTime(rs.getDate("dataSolicitacao"));
				ordemServico.setDataSolicitacao(dataS);
				
				Calendar dataF = Calendar.getInstance();
				dataF.setTime(rs.getDate("dataFinalizacao"));
				ordemServico.setDataFinalizacao(dataF);
				
				//Adicionando um objeto a lista
				result.add(ordemServico);
 			}
			
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean remover (OrdemServico ordemServico) {
		try {
			PreparedStatement stmt = connection.prepareStatement("delete from ordemServico where id=?");
			stmt.setLong(1, ordemServico.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
}
