package fytms.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fytms.bean.dataShipBean;
import fytms.bean.dataTicketBean;
import fytms.bean.dataTravellerBean;
import fytms.bean.sysTravelBean;
import fytms.bean.tax;
import fytms.bean.teamInfo;
import fytms.convert.RSAUtils;
import fytms.service.travelService;

@Controller
@RequestMapping("/travel")
public class travelController {
	@Autowired
	private travelService ts;
	public HashMap<String, dataTravellerBean> hash = new HashMap<String, dataTravellerBean>();
	public HashMap<String, List<dataTicketBean>> hash2 = new HashMap<String, List<dataTicketBean>>();
	public HashMap<String, dataTicketBean> hash3 = new HashMap<String, dataTicketBean>();

	/**
	 * 跳转
	 * 
	 * @param model
	 * @param dtb
	 * @return
	 */
	@RequestMapping(value = "/jump", method = RequestMethod.POST)
	public String jump(Model model, @RequestParam String legalNo) {
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		return "travel/travelIndex";
	}

	/**
	 * 维护旅客信息功能
	 * 
	 * @param model
	 * @param dtb
	 * @return
	 */
	@RequestMapping(value = "/weihuTraveller", method = RequestMethod.POST)
	public String weihuUser(Model model, @RequestParam String legalNo) {
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		List<dataTravellerBean> wjp = ts.wjpTraveller(legalNo);// 未检票乘客
		model.addAttribute("list", wjp);
		return "travel/weihuTraveller";
	}

	/**
	 * 跳转到更改密码
	 * 
	 * @param model
	 * @param legalNo
	 * @return
	 */
	@RequestMapping(value = "/jumpChangePassword", method = RequestMethod.POST)
	public String jumpChangePassword(Model model, @RequestParam String legalNo) {
		String leno = legalNo;
		sysTravelBean travel = ts.loginByLegalNo(leno);
		model.addAttribute("travel", travel);
		return "travel/changePassword";
	}

	/**
	 * 更改旅行社密码
	 * 
	 * @param model
	 * @param response
	 * @param stb
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(Model model, HttpServletResponse response, sysTravelBean stb) throws Exception {
		String source = new String(stb.getTravelPassword());
		System.out.println("\r加密前文字：\r\n" + source);
		byte[] data2 = source.getBytes();
		byte[] encodedData = RSAUtils.encryptByPublicKey(data2, RSAUtils.publicKey);
		System.out.println("加密后文字：\r\n" + encodedData.length);
		System.out.println("加密后文字：\r\n" + new String(encodedData));
		stb.setTravelPassword(encodedData);
		ts.changePassword(stb);
		String leno = stb.getLegalNo();
		sysTravelBean travel = ts.loginByLegalNo(leno);
		model.addAttribute("travel", travel);
//        List<dataTravellerBean> dtb = ts.allTraveller(leno);
//        model.addAttribute("list", dtb);
		return "travel/travelIndex";
	}

	/**
	 * 增加旅客（没插入）
	 * 
	 * @param model
	 * @param response
	 * @param dtb
	 * @param stb
	 * @param travelName
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/addTraveller", method = RequestMethod.POST)
	public String addTraveller(Model model, dataTravellerBean dtb, @RequestParam String travelName,
			@RequestParam String legalNo) {
		if (hash.containsKey(legalNo)) {
			hash.remove(legalNo);
		}
		model.addAttribute("travelName", travelName);
		model.addAttribute("legalNo", legalNo);
		List<dataTravellerBean> sexList = ts.findSex();
		model.addAttribute("sexList", sexList);
		System.out.println(dtb);
		if (dtb.getPassportNo() == null) {
			return "travel/addTraveller";
		} else {
			dtb.setTrPort(0);
			dtb.setTrTravel(legalNo);
			dtb.setdSex(ts.selectSex(dtb.getTrSex()));
			hash.put(legalNo, dtb);
			model.addAttribute("dtb", dtb);
			return "travel/yesTraveller";
		}
	}

	/**
	 * 插入旅客
	 * 
	 * @param model
	 * @param legalNo
	 * @return
	 */
	@RequestMapping(value = "/addT", method = RequestMethod.POST)
	public String addT(Model model, @RequestParam String legalNo) {
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		dataTravellerBean dtb = hash.get(legalNo);
		System.out.println(dtb);
		dataTravellerBean dtb2 = ts.yesTraveller(dtb.getPassportNo());
		System.out.println("dtb2=" + dtb2);
		if (dtb2 != null) {
			ts.addTraveller2(dtb);
			System.out.println("dtb2+++" + dtb2);
		} else {
			ts.addTraveller(dtb);
			System.out.println("dtb2---" + dtb2);
		}
		hash.remove(legalNo);
		List<dataTravellerBean> wjp = ts.wjpTraveller(legalNo);// 未检票乘客
		model.addAttribute("list", wjp);
		return "travel/weihuTraveller";
	}

	/**
	 * 更新旅客的旅行社和权限
	 * 
	 * @param model
	 * @param legalNo
	 * @param passportNo
	 * @return
	 */
	@RequestMapping(value = "/addT2", method = RequestMethod.POST)
	public String addT2(Model model, @RequestParam String legalNo, @RequestParam String passportNo) {
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		ts.upTravel(passportNo, legalNo);
		List<dataTravellerBean> wjp = ts.wjpTraveller(legalNo);// 未检票乘客
		model.addAttribute("list", wjp);
		return "travel/weihuTraveller";
	}

	/**
	 * 取消插入并返回
	 * 
	 * @param model
	 * @param legalNo
	 * @return
	 */
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String cancel(Model model, @RequestParam String legalNo) {
		hash.remove(legalNo);
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		List<dataTravellerBean> wjp = ts.wjpTraveller(legalNo);// 未检票乘客
		model.addAttribute("list", wjp);
		return "travel/weihuTraveller";
	}

	/**
	 * 查找旅客(模糊查询)
	 * 
	 * @param model
	 * @param legalNo
	 * @return
	 */
	@RequestMapping(value = "/searchPassportNo", method = RequestMethod.POST)
	public String searchPassportNo(Model model, @RequestParam String passportNo, @RequestParam String legalNo) {
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		System.out.println("+++" + passportNo);
		passportNo = passportNo.toUpperCase();
		System.out.println("+++" + passportNo);
		List<dataTravellerBean> wjp = ts.searchPassportNo(passportNo, legalNo);// 模糊查询
		model.addAttribute("list", wjp);
		return "travel/weihuTraveller";
	}

	/**
	 * 全局搜索
	 * 
	 * @param model
	 * @param passportNo
	 * @param legalNo
	 * @return
	 */
	@RequestMapping(value = "/searchAllPassportNo", method = RequestMethod.POST)
	public String searchAllPassportNo(Model model, @RequestParam String passportNo, @RequestParam String legalNo) {
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		System.out.println("+++" + passportNo);
		passportNo = passportNo.toUpperCase();
		System.out.println("+++" + passportNo);
		dataTravellerBean wjp = ts.searchAllPassportNo(passportNo);// 精确
		if (wjp != null) {
			model.addAttribute("dtb", wjp);
			return "travel/yesTraveller2";
		} else {
			List<dataTravellerBean> wjp2 = ts.wjpTraveller(legalNo);// 未检票乘客
			model.addAttribute("list", wjp2);
			return "travel/weihuTraveller";
		}
	}

	/**
	 * 跳转到更改旅客
	 * 
	 * @param model
	 * @param passportNo
	 * @param legalNo
	 * @return
	 */
	@RequestMapping(value = "/jumpChangeT", method = RequestMethod.POST)
	public String jumpChangeT(Model model, @RequestParam String passportNo, @RequestParam String legalNo) {
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		dataTravellerBean dtb = ts.yesTraveller(passportNo);
		model.addAttribute("list", dtb);
		System.out.println(dtb);
		List<dataTravellerBean> sexList = ts.findSex();
		model.addAttribute("sexList", sexList);
		return "travel/addTraveller2";
	}

	/**
	 * 删除乘客
	 * 
	 * @param model
	 * @param passportNo
	 * @param legalNo
	 * @return
	 */
	@RequestMapping(value = "/deleteT", method = RequestMethod.POST)
	public String deleteT(Model model, @RequestParam String passportNo, @RequestParam String legalNo) {
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		ts.deleteTraveller(passportNo);
		List<dataTravellerBean> wjp = ts.wjpTraveller(legalNo);// 未检票乘客
		model.addAttribute("list", wjp);
		return "travel/weihuTraveller";
	}

	/**
	 * 开始购票显示船次
	 * 
	 * @param model
	 * @param passportNo
	 * @param legalNo
	 * @return
	 */

	@RequestMapping(value = "/startT2", method = RequestMethod.POST)
	public String startT(Model model, @RequestParam String legalNo, @RequestParam String Start,
			@RequestParam String Return, @RequestParam String StartPort) {
		if (hash2.containsKey(legalNo)) {
			hash2.remove(legalNo);
		}
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		System.out.println(Start);
		System.out.println(Return);
		System.out.println(StartPort);
		model.addAttribute("Start", Start);
		model.addAttribute("Return", Return);
		ArrayList<String> sss = ts.sss1();// 所有船次
		List<dataShipBean> list = new ArrayList<>();
		for (int i = 0; i < sss.size(); i++)
			list.add(ts.searchSingleShiptime(sss.get(i), Start));
		System.out.println(list);

		java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("HH:mm");
		List<String> startList = new ArrayList<String>();
		List<String> arrList = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			startList.add(dateConvert.format(list.get(i).getStartTime()));
			arrList.add(dateConvert.format(list.get(i).getArrTime()));
		}

		model.addAttribute("startList", startList);
		model.addAttribute("arrList", arrList);
//        model.addAttribute("sellList", sellList);
		model.addAttribute("list", list);
		return "travel/searchShip3";
	}

	/**
	 * 跳转到选人
	 * 
	 * @param model
	 * @param shiptimeNo
	 * @param legalNo
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/jumpTravelI", method = RequestMethod.POST)
	public String jumpTravelI(Model model, @RequestParam String shiptimeNo, @RequestParam String legalNo,
			@RequestParam String startDate, @RequestParam String returnDate) throws ParseException {
		System.out.println(shiptimeNo);
		System.out.println(returnDate);
		System.out.println(startDate);
		sysTravelBean travel = ts.loginByLegalNo(legalNo);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date startD = sdf.parse(startDate);
		Date now = new Date();
		float lstart = startD.getTime();
		float lnow = now.getTime();
		float hours = ((lstart - lnow) / (1000 * 60 * 60));
		System.out.println("hour" + hours);
		int sellT = ts.searchSellTime(shiptimeNo);
		System.out.println("sellT" + sellT);
		if (hours <= sellT && hours >= 12) {

			model.addAttribute("travel", travel);
			model.addAttribute("shiptimeNo", shiptimeNo);
			model.addAttribute("returnDate", returnDate);
			model.addAttribute("startDate", startDate);
			int seat = ts.searchSingleShiptime(shiptimeNo, startDate).getsSeat();
			model.addAttribute("seat", seat);
			List<dataTravellerBean> wjp = ts.wjpTraveller(legalNo);// 未检票乘客
			model.addAttribute("list", wjp);
			return "travel/travelI";
		} else {
			String s = "距出航时间还有:" + hours + "小时,超过起售时间/小于12小时";
			return s;
		}
	}

	/**
	 * 选择用户后分离传入护照号
	 * 
	 * @param model
	 * @param response
	 * @param dtbs
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "teamNo", method = RequestMethod.POST)
	public String teamNo(Model model, @RequestParam String st, @RequestParam String re, @RequestParam String shiptimeNo,
			@RequestParam String passportNo, @RequestParam String legalNo) {
		System.out.println(st);
		System.out.println(re);
		if (hash2.containsKey(legalNo)) {
			hash2.remove(legalNo);
		}
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		model.addAttribute("shiptimeNo", shiptimeNo);
		model.addAttribute("re", re);
		model.addAttribute("st", st);
		String[] str = passportNo.split(",");
		List<dataTicketBean> ldtb = new ArrayList<>();
		int seat = ts.searchSingleShiptime(shiptimeNo, st).getsSeat();
		model.addAttribute("seat", seat);
		if (seat >= str.length) {
			for (int i = 0; i < str.length; i++) {
				dataTicketBean dtb = new dataTicketBean();
				String[] str2 = str[i].split("\\+");
				String s = str2[0];
				dtb.setPassportNo(s);
				dtb.setTickTime(shiptimeNo);
				dtb.setTickTravel(legalNo);
				dtb.setState("未检票");
				dtb.setTickType(1);
				dtb.setdTicketType("成人");
				dtb.setStartDate(st);
				dtb.setReturnDate(re);
				ldtb.add(i, dtb);
			}
			hash2.put(legalNo, ldtb);
			System.out.println(ldtb);
			model.addAttribute("list", str);
			List<dataTicketBean> type = ts.findTType();
			model.addAttribute("type", type);
			return "travel/travelI2";
		} else {
			List<dataTravellerBean> wjp = ts.wjpTraveller(legalNo);// 未检票乘客
			model.addAttribute("list", wjp);
			return "travel/travelI";
		}
	}

	/**
	 * 选择并确定身份
	 * 
	 * @param model
	 * @param legalNo
	 * @param str
	 * @param shiptimeNo
	 * @param sign
	 * @return
	 */
	@RequestMapping(value = "teamNo2", method = RequestMethod.POST)
	public String teamNo2(Model model, @RequestParam String st, @RequestParam String re, @RequestParam String legalNo,
			@RequestParam String str, @RequestParam String shiptimeNo, @RequestParam String sign) {
		System.out.println(shiptimeNo);
		System.out.println(sign);
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("travel", travel);
		model.addAttribute("shiptimeNo", shiptimeNo);
		model.addAttribute("re", re);
		model.addAttribute("st", st);
		System.out.println("re" + re);
		System.out.println("st" + st);
		String[] s2 = str.split("\\+");
		String s = s2[0];
		System.out.println("s=" + s);// 选中的passportNo
		if (sign.equals("导游")) {
			for (int i = 0; i < hash2.get(legalNo).size(); i++) {
				if (hash2.get(legalNo).get(i).getPassportNo().equals(s)) {
					hash2.get(legalNo).get(i).setIsGuide(1);
					System.out.println(hash2.get(legalNo).get(i));
				} else
					hash2.get(legalNo).get(i).setIsGuide(0);
			}
		} else {
			for (int i = 0; i < hash2.get(legalNo).size(); i++) {
				if (hash2.get(legalNo).get(i).getPassportNo().equals(str.split("\\+")[0])) {
					hash2.get(legalNo).get(i).setTickType(Integer.parseInt(sign));
					hash2.get(legalNo).get(i).setdTicketType(ts.findType(Integer.parseInt(sign)).getdTicketType());
				} else
					hash2.get(legalNo).get(i)
							.setdTicketType(ts.findType(hash2.get(legalNo).get(i).getTickType()).getdTicketType());
			}
		}
		System.out.println(hash2.get(legalNo));
		model.addAttribute("list", hash2.get(legalNo));
		float money = 0;
		float price = ts.findPrice(shiptimeNo);
		System.out.println("price=" + price);
		for (int i = 0; i < hash2.get(legalNo).size(); i++) {
			hash2.get(legalNo).get(i)
					.setTickCost((ts.findType(hash2.get(legalNo).get(i).getTickType()).getdPercent()) * price);
			money = money + (ts.findType(hash2.get(legalNo).get(i).getTickType()).getdPercent()) * price;
			System.out.println("money=" + money);
		}
		int seat = ts.searchSingleShiptime(shiptimeNo, st).getsSeat();
		model.addAttribute("seat", seat);
		List<dataTicketBean> type = ts.findTType();
		model.addAttribute("type", type);
		model.addAttribute("money", money);
		return "travel/travelI3";
	}

	/**
	 * 支付
	 * 
	 * @param model
	 * @param legalNo
	 * @param shiptimeNo
	 * @param money
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "pay", method = RequestMethod.POST)
	public String pay(Model model, @RequestParam String st, @RequestParam String legalNo,
			@RequestParam String shiptimeNo, @RequestParam float money) throws ParseException {
		System.out.println(shiptimeNo);
		System.out.println(st);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date startD = sdf.parse(st);
		Date now = new Date();
		float lstart = startD.getTime();
		float lnow = now.getTime();
		float hours = ((lstart - lnow) / (1000 * 60 * 60));
		System.out.println("hour" + hours);
		sysTravelBean travel = ts.loginByLegalNo(legalNo);
		model.addAttribute("shiptimeNo", shiptimeNo);
		if (hash2.containsKey(legalNo)) {
			if ((money <= travel.getMoney())
					&& (ts.searchSingleShiptime(shiptimeNo, st).getsSeat() >= hash2.get(legalNo).size())
					&& (hours >= 12)) {
				ts.upM(legalNo, travel.getMoney() - money);

				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
				String nowDate = dateFormat.format(now);
				String tN = legalNo.substring(12, 15);// 旅行社工商号截取
				String teamNo = nowDate + tN;// 团号
				List<dataTicketBean> ldtb = hash2.get(legalNo);
				for (int i = 0; i < ldtb.size(); i++) {
					ldtb.get(i).setTickNo(nowDate + ldtb.get(i).getPassportNo());
					ldtb.get(i).setTeamNo(teamNo);
					ldtb.get(i).setTickDate(now);
					ts.addTicket2(ldtb.get(i));
				}
				System.out.println(ldtb);
//                List<dataTravellerBean> wjp = ts.wjpTraveller(legalNo);// 未检票乘客
//                model.addAttribute("list", wjp);
				sysTravelBean travel2 = ts.loginByLegalNo(legalNo);
				model.addAttribute("travel", travel2);
//                List<dataTravellerBean> list = ts.allTraveller(legalNo);
//                model.addAttribute("list", list);
				int seat = ts.searchSingleShiptime(shiptimeNo, st).getsSeat();
				seat = seat - hash2.get(legalNo).size();
				System.out.println(seat);
//                ts.upSeat(shiptimeNo, seat);
				hash2.remove(legalNo);

				List<teamInfo> ti = ts.showTeam(teamNo);
				SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
				for (int i = 0; i < ti.size(); i++) {
					ti.get(i).setfDate(format.format(ti.get(i).getTickDate()));
					if (ti.get(i).getCheckDate() != null) {
						ti.get(i).setfCheckDate(format.format(ti.get(i).getCheckDate()));
					} else
						ti.get(i).setfCheckDate("-");
					if (ti.get(i).getIsGuide() == 1) {
						ti.get(i).setfGuide("导游");
					} else {
						ti.get(i).setfGuide("旅客");
					}
				}
				model.addAttribute("list", ti);
				String fStart = format.format(ti.get(0).getStartDate());
				String fReturn = format.format(ti.get(0).getReturnDate());
				model.addAttribute("fStart", fStart);
				model.addAttribute("fReturn", fReturn);

				return "travel/teamNo3";
			} else
				return "余额不足／座位不够";
		} else
			return "hash中无该旅行社，请重新订票";
	}

	
	
}