package esequipgit.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import esequipgit.models.Cliente;

public class ClienteDAO  {
	
	private Connection connection;
	
	public ClienteDAO() {
		connection = ConnectionFactory.getConnection();
	}
	
	public boolean inserir(Cliente cliente) {
		String sql = "insert into clientes (cpf, nome, endereco, telefone)" + "values (?, ?, ?, ?);";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, cliente.getCpf());
			stmt.setString(2, cliente.getNome());
			stmt.setString(3, cliente.getEndereco());
			stmt.setString(4, cliente.getTelefone());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}	
		return true;
	}

	public List <Cliente> getLista() {
		List<Cliente> result = new ArrayList<>();
		
		try {
			PreparedStatement stmt =  this.connection.prepareStatement("select * from clientes");
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				//criando o objeto Cliente
				Cliente cliente = new Cliente ();
				cliente.setId(rs.getLong("id"));
				cliente.setCpf(rs.getString("cpf"));
				cliente.setNome(rs.getString("nome"));
				cliente.setEndereco(rs.getString("endereco"));
				cliente.setTelefone(rs.getString("telefone"));
				
				//adicionando o objeto a lista
				result.add(cliente);
			}
			
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean alterar (Cliente cliente) {
		String sql = "update clientes set cpf=?, nome=?, endereco=?, telefone=? where id=?";
		
		try {
			PreparedStatement stmt =  connection.prepareStatement(sql);
			stmt.setString(1, cliente.getCpf());
			stmt.setString(2, cliente.getNome());
			stmt.setString(3, cliente.getEndereco());
			stmt.setString(4, cliente.getTelefone());
			stmt.setLong(5, cliente.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public boolean remover (Cliente cliente) {
		
		try {
			PreparedStatement stmt =  connection.prepareStatement("delete from clientes where id=?");
			stmt.setLong(1, cliente.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public Cliente getById(Long id) {
		Cliente result = null;
		
		try { 
			PreparedStatement stmt = (PreparedStatement) this.connection.prepareStatement("select * from clientes where id =?;");
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				//criando o objeto Cliente
				result = new Cliente ();
				result.setId(rs.getLong("id"));
				result.setNome(rs.getString("nome"));
				result.setCpf(rs.getString("cpf"));
				result.setEndereco(rs.getString("endereco"));
				result.setTelefone(rs.getString("telefone"));
			}
			
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}