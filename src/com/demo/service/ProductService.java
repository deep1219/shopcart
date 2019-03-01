package com.demo.service;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.demo.model.Product;

public class ProductService
{
	Connection con;
	Properties prop = new Properties();
	InputStream input = null;
	public ProductService()
	{
		try
		{
//			input = new FileInputStream("config.properties");
			prop.load(getClass().getResourceAsStream("config.properties"));
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			@SuppressWarnings("unused")
			String url = prop.getProperty("url");
			String username = prop.getProperty("username");
			String password = prop.getProperty("password");
			con = DriverManager.getConnection(url, username, password);
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feb2019", "root", "root");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public ArrayList<Product> viewAll()
	{
		ArrayList<Product> list = new ArrayList<>();
		try 
		{
			PreparedStatement ps = con.prepareCall("select * from product");
			ResultSet rs = ps.executeQuery();
			if(!rs.next())
			{
				System.out.println("No Data");
			}
			do
			{
				Product p = new Product(rs.getString(2), rs.getDouble(3), rs.getString(4));
				p.setId(rs.getInt(1));
				list.add(p);
				
			}while(rs.next());
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(String name, Double price, String seller)
	{
		try
		{
			PreparedStatement ps = con.prepareStatement("insert into product(name, price, seller)values (?,?,?)");
			ps.setString(1, name);
			ps.setDouble(2, price);
			ps.setString(3, seller);
			return ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return -1;
	}
	public int delete(int id)
	{
		try
		{
			String sql = "DELETE FROM product WHERE id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			 int status =  ps.executeUpdate();
			
			System.out.println("Query executed");
			if(status >0)
			{
				System.out.println("Querey Deleted");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	
		
}
