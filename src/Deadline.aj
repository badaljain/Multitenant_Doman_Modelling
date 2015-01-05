import java.io.BufferedReader;
import java.io.InputStreamReader;


public aspect Deadline {
	pointcut CallProjectName():
		execution(void Multitenant.createProject());
	after(Multitenant m): CallProjectName() && this(m) {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("Enter Deadline :");
        String name = "";
		try {
			name = br.readLine();
			System.out.println(name);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error :" + e);
		}
       /* String query = "Insert into TENANT_RECORDS_EXTENSION values(1,1001," + "PROJECT_NAME" + "," + '"' + name + '"' + ")";
        System.out.println(query);*/
		
        
}
}