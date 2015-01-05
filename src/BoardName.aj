import java.io.*;

public aspect BoardName {
	
		pointcut callBoardName():
			execution(void Multitenant.createProject());
		after(Multitenant m): callBoardName() && this(m) {
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	        System.out.print("Enter Board Name :");
	        String name = "";
	        DBconnect connect = new DBconnect();
			try {
				name = br.readLine();
				System.out.println(name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("Error :" + e);
			}
			int tenantId = 1;
			int userId = Multitenant.userId +1;
			String updateTenantId = "update TENANT_RECORDS_EXTENSION set TENANT_ID =" + tenantId + "where USER_ID =" + userId;
			System.out.println(updateTenantId);
		    connect.updateData(updateTenantId);
		    String query = "Insert into TENANT_RECORDS_EXTENSION values("+ tenantId + userId + ","  + '"' + "BOARD_NAME" + '"' + "," + '"' + name + '"' + ")";
	        System.out.println(query);
	        connect.insertData(query);
	
	        
}
}