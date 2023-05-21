import com.admin.bean.Admin;
import com.admin.dao.adminDao;
import org.junit.Test;


public class adminDaoTest {
    private  adminDao admindao =new adminDao();
    @Test
    public void testcheckAdminByName(){
        Admin admin =admindao.checkAdminByName("admin");
        System.out.println(admin);
    }
}
