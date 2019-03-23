package fytms.dao;





import java.util.List;

import org.springframework.stereotype.Repository;

import fytms.bean.dataShipBean;
import fytms.bean.sysTravelBean;
import fytms.bean.sysUserBean;


@Repository
public interface post6Dao {
	public List<sysTravelBean> searchAllTravel();
	public List<sysTravelBean> searchTravel(String legalNo);
	public sysTravelBean addTravel(sysTravelBean stb);
	public sysTravelBean changeTravel(sysTravelBean stb);
	public sysTravelBean travelState(String legalNo);
//	public sysTravelBean deleteTravel(String legalNo);
	
	public List<dataShipBean> searchAllShip();
	public List<dataShipBean> searchShip(String shipNo);
	public List<dataShipBean> searchAllShipstate();
//	public dataShipBean searchShipstate(int idt_dic_shipstate);
	public dataShipBean changeShip(dataShipBean dsb);
	public dataShipBean addShip(dataShipBean dsb);
	public dataShipBean shipState(String shipNo);
	
	public List<dataShipBean> searchAllShiptime();
	public List<dataShipBean> searchShiptime(dataShipBean dsb);
	public dataShipBean searchPort(int idt_dic_port);
	public List<dataShipBean> searchAllNormalShip();
	public List<dataShipBean> searchAllPort();
	public dataShipBean addShiptime(dataShipBean dsb);
	public dataShipBean changeShiptime(dataShipBean dsb);
	public dataShipBean deleteShiptime(String shiptimeNo);
	
	public List<sysUserBean> searchAllUser();
	public List<sysUserBean> searchUser(sysUserBean sub);
	public List<sysUserBean> searchUserNoPic(sysUserBean sub);
	public sysUserBean searchSex(int empSex);
	public sysUserBean searchPost(int empPost);
	public sysUserBean searchDept(int empDept);
	public List<sysUserBean> searchAllSex();
	public List<sysUserBean> searchAllPost();
	public List<sysUserBean> searchAllDept();
	public sysUserBean addUser(sysUserBean sub);
	public sysUserBean changeUser(sysUserBean sub);
	public sysUserBean changeUserNoPic(sysUserBean sub);
	public sysUserBean deleteUser(sysUserBean sub);
}

