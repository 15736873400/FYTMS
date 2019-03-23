package fytms.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fytms.dao.travelDao;
import fytms.bean.dataShipBean;
import fytms.bean.dataTicketBean;
import fytms.bean.dataTravellerBean;

import fytms.bean.sysTravelBean;
import fytms.bean.tax;
import fytms.bean.teamInfo;

@Service
public class travelService {
	@Autowired
	private travelDao dao;

	public int searchSellTime(String shiptimeNo) {
		return dao.searchSellTime(shiptimeNo);
	}

	public ArrayList<String> searchSpeTeam(String legalNo, String passportNo) {
		return dao.searchSpeTeam(legalNo, passportNo);
	}

	public ArrayList<String> searchSpeTeam2(String legalNo, String passportNo, String teamNo) {
		return dao.searchSpeTeam2(legalNo, passportNo, teamNo);
	}

	public ArrayList<String> sss1() {
		return dao.sss1();
	}

	public dataShipBean searchSingleShiptime(String shiptimeNo, String Start) {
		return dao.searchSingleShiptime(shiptimeNo, Start);
	}

	public void deleteOne(dataTicketBean dtb) {
		dao.deleteOne(dtb);
	}

	public List<tax> searchTax() {
		return dao.searchTax();
	}

	public dataTicketBean searchTick(String tickNo) {
		return dao.searchTick(tickNo);
	}

	public List<teamInfo> showTeam(String teamNo) {
		return dao.showTeam(teamNo);
	}

	public ArrayList<String> searchTeam(String legalNo) {
		return dao.searchTeam(legalNo);
	}

	public ArrayList<String> searchTeam2(String legalNo, String teamNo) {
		return dao.searchTeam2(legalNo, teamNo);
	}

	public float findPrice(String shiptimeNo) {
		return dao.findPrice(shiptimeNo);
	}

	public void upM(String legalNo, float money) {
		dao.upM(legalNo, money);
	}

	public void upM2(String legalNo, float money) {
		dao.upM2(legalNo, money);
	}

	public void changePassword(sysTravelBean stb) {
		dao.changePassword(stb);
	}

	public sysTravelBean loginByLegalNo(String legalNo) {
		return dao.loginByLegalNo(legalNo);
	}

	public List<dataTravellerBean> findSex() {
		return dao.findSex();
	}

	public List<dataTicketBean> findTType() {
		return dao.findTType();
	}

	public dataTicketBean findType(int sign) {
		return dao.findType(sign);
	}

	public String selectSex(int trSex) {
		return dao.selectSex(trSex);
	}

	public void addTraveller(dataTravellerBean dtb) {
		dao.addTraveller(dtb);
	}

	public void addTraveller2(dataTravellerBean dtb) {
		dao.addTraveller2(dtb);
	}

	public void deleteTraveller(String passportNo) {
		dao.deleteTraveller(passportNo);
	}

	public void upTravel(String passportNo, String legalNo) {
		dao.upTravel(passportNo, legalNo);
	}

	public dataTravellerBean yesTraveller(String passportNo) {
		return dao.yesTraveller(passportNo);
	}

	public List<dataTravellerBean> searchPassportNo(String passportNo, String legalNo) {
		return dao.searchPassportNo(passportNo, legalNo);
	}

	public dataTravellerBean searchAllPassportNo(String passportNo) {
		return dao.searchAllPassportNo(passportNo);
	}

	public List<dataTravellerBean> wjpTraveller(String legalNo) {
		return dao.wjpTraveller(legalNo);
	}

	public void addTicket2(dataTicketBean dtb) {
		dao.addTicket2(dtb);
	}

}
