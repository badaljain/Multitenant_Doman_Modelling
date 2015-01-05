//import java.beans.Statement;
import java.sql.*;

//import com.sun.corba.se.pept.transport.Connection;


public class DBconnect {

	private Connection con;
	private Statement st;
	private ResultSet rs;
	
	public DBconnect(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Multitenant", "root", "");
			st =con.createStatement();
		}catch(Exception ex){
			System.out.println("Error :" + ex);
		}
	}
	
	public void getData(){
		try{
			String query = "select * from TENANT_RECORDS";
			rs = st.executeQuery(query);
			System.out.println("Results from DB");
			while(rs.next()){
					int recordId = rs.getInt("RECORD_ID");
					int tenantId = rs.getInt("TENANT_ID");
					String tenantName = rs.getString("TENANT_NAME");
					
					System.out.println("RECORD ID :" + recordId);
					System.out.println("TENANT ID :" + tenantId);
					System.out.println("TENANT NAME :" + tenantName);
			}
		}catch(Exception ex){
			System.out.println("Error :" + ex);
		}
	}
	
	public int getMaxUserId(){
		int userId =0;
		try{
			String query = "select MAX(USER_ID) from TENANT_RECORDS_EXTENSION";
			System.out.println(query);
			rs = st.executeQuery(query);
			
			System.out.println("Results from DB");
			while(rs.next()){
					userId = rs.getInt("MAX(USER_ID)");
					
					
					System.out.println("USER ID :" + userId);

			}
		}catch(Exception ex){
			System.out.println("Error :" + ex);
		}
		return userId;
	}
	
	public void insertData(String query){

		try{
			Statement stmt = con.createStatement(); 
			String insertQ = query;
			stmt.executeUpdate(insertQ);
		}catch(Exception ex){
			System.out.println("Error :" + ex);
		}
	}
	
	public void updateData(String query){

		try{
			String updateQ = query;
			st.executeUpdate(updateQ);
		}catch(Exception ex){
			System.out.println("Error :" + ex);
		}
	}
	
}
