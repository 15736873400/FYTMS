package fytms.service;





import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fytms.bean.dataTicketBean;

import fytms.dao.post5Dao;

@Service
public class post5Service {
	@Autowired
	private post5Dao dao;
	public dataTicketBean checkTicket(dataTicketBean dtb) 
	{
		return dao.checkTicket(dtb);
	}
	public dataTicketBean updateCheckTicket(dataTicketBean list) 
	{
		return dao.updateCheckTicket(list);
	}
	public List<dataTicketBean> checkAllTicket() 
	{
		return dao.checkAllTicket();
	}
	
	
	
}
