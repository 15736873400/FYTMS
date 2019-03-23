package fytms.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import fytms.bean.sysTravelBean;
import fytms.bean.sysUserBean;
import fytms.dao.loginDao;

@Service
public class loginService {
	@Autowired
	private loginDao dao;

	/**根据员工号查找密码
	 * @param empNo 
	 * @return
	 */
	public sysUserBean loginByEmpNo(String empNo) 
	{
		return dao.loginByEmpNo(empNo);
	}
	/**根据工商号找密码
	 * @param legalNo
	 * @return
	 */
	public sysTravelBean loginByLegalNo(String legalNo)
	{
		return dao.loginByLegalNo(legalNo);
	}
}
