package fytms.dao;



import org.springframework.stereotype.Repository;


import fytms.bean.sysTravelBean;
import fytms.bean.sysUserBean;

@Repository
public interface loginDao {
	public sysUserBean loginByEmpNo(String empNo);
	public sysTravelBean loginByLegalNo(String legalNo);
	
}
