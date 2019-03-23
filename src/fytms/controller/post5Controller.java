package fytms.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import fytms.bean.dataTicketBean;

import fytms.service.post5Service;

@Controller
@RequestMapping("/post5")
public class post5Controller {
	@Autowired
	private post5Service p5s;
	/**检票
	 * @param model
	 * @param response
	 * @param dtb
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/checkTicket")
	public String searchAllTraveller(Model model,HttpServletResponse response, dataTicketBean dtb) throws IOException {
		if(dtb.getTickNo()==null ||dtb.getTickNo().equals(""))
		{
		   List<dataTicketBean> list=p5s.checkAllTicket();
		   System.out.println(list);
		   java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		    List<String>  tickList =    new  ArrayList<String>(); 
		    List<String>  checkList =    new  ArrayList<String>(); 
		    
		    for(int i=0;i<list.size();i++)
		    {
		    	tickList.add(dateConvert.format(list.get(i).getTickDate()));
		    	checkList.add(dateConvert.format(list.get(i).getCheckDate()));
		    	
		    	
		    } 
		    System.out.println(checkList);
		   model.addAttribute("list",list);
		   model.addAttribute("tickList",tickList);
		   model.addAttribute("checkList",checkList);
		   return "user/postFive/postFive2";
		}
		else {
			dataTicketBean list=p5s.checkTicket(dtb);
			
			if(list==null)
			{List<dataTicketBean> list2=p5s.checkAllTicket();
			SimpleDateFormat dateConvert = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			List<String>  tickList =    new  ArrayList<String>(); 
		    List<String>  checkList =    new  ArrayList<String>(); 
			for(int i=0;i<list2.size();i++)
		    {
		    	tickList.add(dateConvert.format(list2.get(i).getTickDate()));
		    	checkList.add(dateConvert.format(list2.get(i).getCheckDate()));
		    	
		    } 
			
			
			model.addAttribute("list",list2);
			   model.addAttribute("tickList",tickList);
			   model.addAttribute("checkList",checkList);
				return "user/postFive/postFive2";
			}
			else {
			Date now=new Date();
			
	        list.setCheckDate(now);
	        list.setState("已检票");
			
			p5s.updateCheckTicket(list);
			System.out.println(list);
			SimpleDateFormat dateConvert = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");//可以方便地修改日期格式
			List<dataTicketBean> list2=p5s.checkAllTicket();
			List<String>  tickList =    new  ArrayList<String>(); 
		    List<String>  checkList =    new  ArrayList<String>(); 
			for(int i=0;i<list2.size();i++)
		    {
		    	tickList.add(dateConvert.format(list2.get(i).getTickDate()));
		    	checkList.add(dateConvert.format(list2.get(i).getCheckDate()));
		    	
		    } 
			
			
			model.addAttribute("list",list2);
			   model.addAttribute("tickList",tickList);
			   model.addAttribute("checkList",checkList);}
			return "user/postFive/postFive";
		}
		
	}

	
}
