package esequipgit.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import esequipgit.models.Cliente;
import esequipgit.models.Equipamento;
import esequipgit.models.OrdemServico;

public class OrdemServicoDAO {

	private Connection connection;

	public OrdemServicoDAO() {
		connection = ConnectionFactory.getConnection();
	}

	public boolean inserir(OrdemServico ordemServico) {
		String sql = "insert into ordemServico (problema, dataSolicitacao, cliente, equipamento)"
				+ "values (?, ?, ?, ?);";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, ordemServico.getProblema());
			stmt.setDate(2, new java.sql.Date(ordemServico.getDataSolicitacao().getTimeInMillis()));
			stmt.setLong(3, ordemServico.getCliente().getId());
			stmt.setLong(4, ordemServico.getEquipamento().getId());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		return true;
	}

	public List<OrdemServico> getLista() {
		List<OrdemServico> result = new ArrayList<>();

		try {
			PreparedStatement stmt = this.connection.prepareStatement("select * from ordemServico");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// Criando o objeto Ordem de Servico
				OrdemServico ordemServico = new OrdemServico();
				ordemServico.setId(rs.getLong("id"));
				ordemServico.setProblema(rs.getString("problema"));
				ordemServico.setCliente(new Cliente());
				ordemServico.getCliente().setId(rs.getLong("cliente"));
				ordemServico.setEquipamento(new Equipamento());
				ordemServico.getEquipamento().setId(rs.getLong("equipamento"));

				// Montando as datas através do Calendar

				Date dataSTemp = rs.getDate("dataSolicitacao");

				if (dataSTemp != null) {
					Calendar dataS = Calendar.getInstance();
					dataS.setTime(dataSTemp);
					ordemServico.setDataSolicitacao(dataS);
				}

				Date dataFTemp = rs.getDate("dataFinalizacao");
				if (dataFTemp != null) {
					Calendar dataF = Calendar.getInstance();
					dataF.setTime(dataFTemp);
					ordemServico.setDataFinalizacao(dataF);
				}

				// Adicionando um objeto a lista
				result.add(ordemServico);
			}

			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public boolean remover(OrdemServico ordemServico) {
		try {
			PreparedStatement stmt = connection.prepareStatement("delete * from ordemServico where id=?");
			stmt.setLong(1, ordemServico.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	public boolean finalizar(OrdemServico ordemServico) {
		String sql = "update ordemServico set dataFinalizacao=? where id=?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			ordemServico.setDataFinalizacao(Calendar.getInstance());
			stmt.setDate(1, new java.sql.Date(ordemServico.getDataFinalizacao().getTimeInMillis()));
			stmt.setLong(2, ordemServico.getId());
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		return true;
	}

	public OrdemServico getById(Long id) {
		OrdemServico result = null;

		try {
			PreparedStatement stmt = this.connection.prepareStatement("select * from ordemServico where id = ?;");
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				// Criando o objeto Ordem
				result = new OrdemServico();
				result.setId(rs.getLong("id"));
				result.setProblema(rs.getString("problema"));
				result.setCliente(new Cliente());
				result.getCliente().setId(rs.getLong("cliente"));
				result.setEquipamento(new Equipamento());
				result.getEquipamento().setId(rs.getLong("equipamento"));

				// Montando as datas através do Calendar
				Date dataSTemp = rs.getDate("dataSolicitacao");

				if (dataSTemp != null) {
					Calendar dataS = Calendar.getInstance();
					dataS.setTime(dataSTemp);
					result.setDataSolicitacao(dataS);
				}

				Date dataFTemp = rs.getDate("dataFinalizacao");
				if (dataFTemp != null) {
					Calendar dataF = Calendar.getInstance();
					dataF.setTime(dataFTemp);
					result.setDataFinalizacao(dataF);
				}

				rs.close();
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
}