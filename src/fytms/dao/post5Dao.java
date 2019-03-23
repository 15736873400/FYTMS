package fytms.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import fytms.bean.dataTicketBean;


@Repository
public interface post5Dao {
	public dataTicketBean checkTicket(dataTicketBean dtb);
	public dataTicketBean updateCheckTicket(dataTicketBean list);
	
	public List<dataTicketBean> checkAllTicket();
	
}

