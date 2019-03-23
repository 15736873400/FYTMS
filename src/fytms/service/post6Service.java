package fytms.service;







import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fytms.bean.dataShipBean;
import fytms.bean.sysTravelBean;
import fytms.bean.sysUserBean;
import fytms.dao.post6Dao;

@Service
public class post6Service {
	@Autowired
	private post6Dao dao;
	
	public List<sysTravelBean> searchAllTravel()
	{
		return dao.searchAllTravel();
	}
	
	public List<sysTravelBean> searchTravel(String legalNo)
	{
		return dao.searchTravel(legalNo);
	}
	
	public sysTravelBean addTravel(sysTravelBean stb)
	{
		return dao.addTravel(stb);
	}
	
	public sysTravelBean changeTravel(sysTravelBean stb)
	{
		return dao.changeTravel(stb);
	}
	
	public sysTravelBean travelState(String legalNo)
	{
		return dao.travelState(legalNo);
	}
	
//	public sysTravelBean deleteTravel(String legalNo)
//	{
//		return dao.deleteTravel(legalNo);
//	}
	
	public List<dataShipBean> searchAllShip()
	{
		return dao.searchAllShip();
	}
	
	public List<dataShipBean> searchShip(String shipNo)
	{
		return dao.searchShip(shipNo);
	}
	
	public List<dataShipBean> searchAllShipstate()
	{
		return dao.searchAllShipstate();
	}
	
//	public dataShipBean searchShipstate(int idt_dic_shipstate)
//	{
//		return dao.searchShipstate(idt_dic_shipstate);
//	}

	public dataShipBean changeShip(dataShipBean dsb)
	{
		return dao.changeShip(dsb);
	}
	
	public dataShipBean addShip(dataShipBean dsb)
	{
		return dao.addShip(dsb);
	}
	
	public dataShipBean shipState(String shipNo)
	{
		return dao.shipState(shipNo);
	}
	
	public List<dataShipBean> searchAllShiptime()
	{
		return dao.searchAllShiptime();
	}
	
	public List<dataShipBean> searchShiptime(dataShipBean dsb)
	{
		return dao.searchShiptime(dsb);
	}
	
	public dataShipBean searchPort(int idt_dic_port)
	{
		return dao.searchPort(idt_dic_port);
	}
	
	public List<dataShipBean> searchAllNormalShip()
	{
		return dao.searchAllNormalShip();
	}
	
	public List<dataShipBean> searchAllPort()
	{
		return dao.searchAllPort();
	}
	
	public dataShipBean addShiptime(dataShipBean dsb)
	{
		return dao.addShiptime(dsb);
	}
	
	public dataShipBean changeShiptime(dataShipBean dsb)
	{
		return dao.changeShiptime(dsb);
	}
	
	public dataShipBean deleteShiptime(String shiptimeNo)
	{
		return dao.deleteShiptime(shiptimeNo);
	}
	
	public List<sysUserBean> searchAllUser()
	{
		return dao.searchAllUser();
	}
	
	public List<sysUserBean> searchUser(sysUserBean sub)
	{
		return dao.searchUser(sub);
	}
	
	public List<sysUserBean> searchUserNoPic(sysUserBean sub)
	{
		return dao.searchUserNoPic(sub);
	}
	
	public sysUserBean searchDept(int empDept)
	{
		return dao.searchDept(empDept);
	}
	
	public sysUserBean searchPost(int empPost)
	{
		return dao.searchPost(empPost);
	}
	
	public sysUserBean searchSex(int empSex)
	{
		return dao.searchSex(empSex);
	}
	
	public List<sysUserBean> searchAllDept()
	{
		return dao.searchAllDept();
	}
	
	public List<sysUserBean> searchAllPost()
	{
		return dao.searchAllPost();
	}
	
	public List<sysUserBean> searchAllSex()
	{
		return dao.searchAllSex();
	}
	
	public sysUserBean addUser(sysUserBean sub)
	{
		return dao.addUser(sub);
	}
	
	public sysUserBean changeUser(sysUserBean sub)
	{
		return dao.changeUser(sub);
	}
	
	public sysUserBean changeUserNoPic(sysUserBean sub)
	{
		return dao.changeUserNoPic(sub);
	}
	
	public sysUserBean deleteUser(sysUserBean sub)
	{
		return dao.deleteUser(sub);
	}
}
