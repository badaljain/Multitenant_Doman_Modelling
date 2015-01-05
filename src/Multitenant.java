
public class Multitenant {

	static int tenantId;
	static int userId;
	
	public void createProject() {
	}
	
	public void setTenantId(int value){
		this.tenantId = value;
	}
	
	public void setUserId(){
		DBconnect connect = new DBconnect();
		int userId = connect.getMaxUserId();
		this.userId = userId;
		System.out.println("Max User Id is:" + this.userId);
	}
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DBconnect connect = new DBconnect();
		//connect.getData();
		
		Multitenant m = new Multitenant();
		m.createProject();

	}

}
