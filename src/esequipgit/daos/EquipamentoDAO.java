package esequipgit.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import esequipgit.models.Cliente;
import esequipgit.models.Equipamento;

public class EquipamentoDAO {

	private Connection connection;
	
	public EquipamentoDAO () {
		connection = ConnectionFactory.getConnection();
	}
	
	public boolean inserir (Equipamento equipamento) {
		String sql = "insert into equipamentos (nome, marca, modelo, numeroSerie, acessorios, cliente)" + "values (?, ?, ?, ?, ?, ?);";
	
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, equipamento.getNome());
			stmt.setString(2, equipamento.getMarca());
			stmt.setString(3, equipamento.getModelo());
			stmt.setString(4, equipamento.getNumeroSerie());
			stmt.setString(5, equipamento.getAcessorios());
			stmt.setLong(6, equipamento.getCliente().getId());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public List <Equipamento> getLista(Cliente c) {
		List <Equipamento> result = new ArrayList<>();
		
		try {
			PreparedStatement stmt = this.connection.prepareStatement("select * from equipamentos");
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				//Criando o objeto Equipamento
				Equipamento equipamento = new Equipamento ();
				equipamento.setId(rs.getLong("id"));
				equipamento.setNome(rs.getString("nome"));
				equipamento.setMarca(rs.getString("marca"));
				equipamento.setModelo(rs.getString("modelo"));
				equipamento.setNumeroSerie(rs.getString("numeroSerie"));
				equipamento.setAcessorios(rs.getString("acessorios"));
				equipamento.setCliente(new Cliente());
				equipamento.getCliente().setId(rs.getLong("cliente"));
				
				//Adicionando objeto a lista
				result.add(equipamento);
			}
			
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean alterar (Equipamento equipamento) {
		String sql = "update equipamentos set nome=?, marca=?, modelo=?, numeroSerie=?, acessorios=? where id=?";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, equipamento.getNome());
			stmt.setString(2, equipamento.getMarca());
			stmt.setString(3, equipamento.getModelo());
			stmt.setString(4, equipamento.getNumeroSerie());
			stmt.setString(5, equipamento.getAcessorios());
			stmt.setLong(6, equipamento.getId());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public boolean remover (Equipamento equipamento) {
		try {
			PreparedStatement stmt = connection.prepareStatement("delete from equipamentos where id=?");
			
			stmt.setLong(1, equipamento.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public Equipamento getById(Long id) {
		Equipamento result = null;
		
		try {
			PreparedStatement stmt = this.connection.prepareStatement("select * from equipamentos where id = ?;");
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) { 
				//Criando o objeto Equipamento
				result = new Equipamento();
				result.setId(rs.getLong("id"));
				result.setNome(rs.getString("nome"));
				result.setMarca(rs.getString("marca"));
				result.setModelo(rs.getString("modelo"));
				result.setNumeroSerie(rs.getString("numeroSerie"));
				result.setAcessorios(rs.getString("acessorios"));
				result.setCliente(new Cliente());
				result.getCliente().setId(rs.getLong("cliente"));
			}
			
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}