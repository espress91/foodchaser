package gram.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import gram.model.dto.Truck;


public class TruckDAOImpl implements TruckDAO 
{

	@SuppressWarnings("finally")
	@Override
	public ArrayList<Truck> selectAll(String title) throws SQLException 
	{
		PreparedStatement ps = null;									// PreparedStatement(여기에 쿼리문 넣는다)
		ResultSet rs = null;
		Connection con = null;
		ArrayList<Truck> tru = new ArrayList<Truck>();
		Truck trus = null;
		try 
		{
			//Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbook","root","1q2w3e");
			ps = con.prepareStatement("select truck_name, truck_intro, truck_mail, truck_picture, menu_name, price, piture from truck a, menu b where a.truck_number = b.truck_number and a.truck_name ='" + title+"'");			
			ps.executeQuery();	
			rs = ps.executeQuery();
			
			while(rs.next())											// 데이터를 한개씩 담는다.
			{
				trus = new Truck(
					rs.getString(1), 
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7)
				);
						
				tru.add(trus);										//속성의 수만큼 값을 받아온다음에 list에 넣어준다.
			}

		}
		
		catch(Exception e) {
			System.out.printf("오류떳다\n");
		}
		finally
		{
			if(rs != null)
			{
				rs.close();
			}
			
			if(ps != null)
			{
				ps.close();
			}
			
			if(con != null)
			{
				con.close();
			}
			
			return tru;
		}
	}

	@Override
	public int insert(Truck tru) throws SQLException 
	{
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try
		{
			//Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbook","root","1q2w3e");
			ps = con.prepareStatement("insert into Truck_comment values(?,?,?,?,");
			//?의 순서대로 개수만큼 setXxx()필요
			ps.setString(2, tru.getUser_name());
			ps.setInt(3, tru.getStar());
			ps.setString(4, tru.getComment());
			
			result = ps.executeUpdate();
		}
		
		finally
		{		
			if(ps != null)
			{
				ps.close();
			}
			
			if(con != null)
			{
				con.close();
			}
		}
		
		return result;
	}

}
