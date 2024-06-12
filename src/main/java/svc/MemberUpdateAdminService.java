package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberVO;

public class MemberUpdateAdminService {
	public boolean Update(String sql) { 
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance(); 
		memberDAO.setConnection(con); 
		boolean loginResult = false;

		int cnt = memberDAO.UpdateAdmin(sql);
		
		if(cnt > 0){
			loginResult = true;
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return loginResult;
	}
}
