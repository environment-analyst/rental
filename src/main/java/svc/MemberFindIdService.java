package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberVO;

public class MemberFindIdService {
	public boolean findId(MemberVO member) {
		boolean joinSuccess = false;
		MemberDAO memberDAO = MemberDAO.getInstance();
		Connection con = getConnection();
		memberDAO.setConnection(con);
		int insertCount = memberDAO.findId(member);
		if(insertCount > 0){
			joinSuccess = true;
		}
		else{
		}
		close(con);
		return joinSuccess;
	}
}
