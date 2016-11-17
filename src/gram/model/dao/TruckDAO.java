package gram.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import gram.model.dto.Truck;

public interface TruckDAO 
{
	/**
	  * ���ڵ� ��ü �˻�
	  * */
	  ArrayList<Truck> selectAll(String title) throws SQLException;								// ��� ���ڵ� �ǻ� = ������ ��° �����ֱ�  ������ Electronics�� �����ϰ� �������� list�� �����Ѵ�. 

	/**
	 * ���ڵ� ����
	 * @return : true-���Լ��� , false - ���Խ���
	 * */
	  	int insert(Truck tru) throws SQLException;
}
