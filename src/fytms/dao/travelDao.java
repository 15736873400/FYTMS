package fytms.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import fytms.bean.dataShipBean;
import fytms.bean.dataTicketBean;
import fytms.bean.dataTravellerBean;
import fytms.bean.sysTravelBean;
import fytms.bean.tax;
import fytms.bean.teamInfo;

@Repository
public interface travelDao {
	public int searchSellTime(@Param(value="shiptimeNo") String shiptimeNo);
	public ArrayList<String> searchSpeTeam(@Param(value="legalNo") String legalNo,@Param(value="passportNo") String passportNo);
	public ArrayList<String> searchSpeTeam2(@Param(value="legalNo") String legalNo,@Param(value="passportNo") String passportNo,@Param(value="teamNo") String teamNo);
	
	public sysTravelBean loginByLegalNo(String legalNo);
	public List<dataTravellerBean> wjpTraveller(String legalNo);
	public void changePassword(sysTravelBean stb);
	public List<dataTravellerBean> findSex();
	public String selectSex(int trSex);
	public dataTravellerBean yesTraveller(String passportNo);
	public void addTraveller2(dataTravellerBean dtb);
	public void addTraveller(dataTravellerBean dtb);
	public void upTravel(@Param(value="passportNo") String passportNo,@Param(value="legalNo") String legalNo);
	public List<dataTravellerBean> searchPassportNo(@Param(value="passportNo") String passportNo,@Param(value="legalNo") String legalNo);
	public dataTravellerBean searchAllPassportNo(@Param(value="passportNo") String passportNo);
	public void deleteTraveller(@Param(value="passportNo") String passportNo);
	public ArrayList<String> sss1(); 
	public dataShipBean searchSingleShiptime(@Param(value="shiptimeNo") String shiptimeNo,@Param(value="Start") String Start);
	public List<dataTicketBean> findTType();
	public dataTicketBean findType(int sign);
	public float findPrice(@Param(value="shiptimeNo") String shiptimeNo);
	public void upM(@Param(value="legalNo") String legalNo,@Param(value="money") float money);
	public void addTicket2(dataTicketBean dtb);
	public ArrayList<String> searchTeam(@Param(value="legalNo") String legalNo); 
	public ArrayList<String> searchTeam2(@Param(value="legalNo") String legalNo,@Param(value="teamNo") String teamNo);
	public List<teamInfo> showTeam(@Param(value="teamNo") String teamNo);
	public dataTicketBean searchTick(@Param(value="tickNo") String tickNo);
	public List<tax> searchTax();
	public void deleteOne(dataTicketBean dtb);
	public void upM2(@Param(value="legalNo") String legalNo,@Param(value="money") float money);
}

