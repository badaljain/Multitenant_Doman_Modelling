import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public aspect ProjectName {
	
		pointcut CallProjectName(): execution(void Multitenant.createProject());
		after(Multitenant m): CallProjectName() && this(m) {
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	        System.out.print("Enter ProjectName :");
	        String name = "";
	        DBconnect connect = new DBconnect();
	        try {
				name = br.readLine();
				System.out.println(name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("Error :" + e);
			}
	        m.setUserId();
	        int userId = Multitenant.userId +1;
	        String query = "Insert into TENANT_RECORDS_EXTENSION values(1," + userId + ","  + '"' + "PROJECT_NAME" + '"' + "," + '"' + name + '"' + ")";
	        System.out.println(query);
	       // connect.insertData(query);
	        
	        
}
}
