package gram.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import gram.model.dao.TruckDAOImpl;
import gram.model.dto.Truck;

public class TruckService 
{
	static TruckDAOImpl dao = new TruckDAOImpl();
	public static ArrayList<Truck> selectAll(String title) throws SQLException
	{
		return dao.selectAll(title);
	}
	
	public static int insert(Truck tru) throws SQLException
	{
		int result = dao.insert(tru);
		if(result == 0)
		{
			throw new SQLException("���Ե��� �ʾҽ��ϴ�."); // insert�� �ȵǸ� 0 ����  ��ϱ� ���������� ����ó���� �ϴ� ��
		}
		
		return result;
		//return dao.insert(electronics);
	}
}
