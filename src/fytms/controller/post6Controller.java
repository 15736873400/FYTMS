package fytms.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.io.File;//文件操作

import fytms.bean.dataShipBean;
import fytms.bean.sysTravelBean;
import fytms.bean.sysUserBean;
import fytms.convert.RSAUtils;
import fytms.service.post6Service;

@Controller
@RequestMapping("/post6")
public class post6Controller {
    @Autowired
    private post6Service p6s;
    public int num = 0;// 是否需要重新写入pic
    String t = Thread.currentThread().getContextClassLoader().getResource("").getPath(); // 获取文件绝对路径
    int c = t.indexOf(".metadata");
    String path = "/" + t.substring(1, c) + "FYTMS/WebContent/pic/";// 图片路径
    // String path="/usr/local/tomcat/webapps/FYTMS/pic/";//部署到服务器位置

    /**
     * 跳转
     * 
     * @param model
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/jump")
    public String jump(Model model, HttpServletResponse response) throws IOException {
        return "user/postSix/postSix";
    }

    /**
     * （根据工商号）查找旅行社
     * 
     * @param model
     * @param response
     * @param stb
     * @return
     * @throws IOException
     */
    @RequestMapping("/searchTravel")
    public String searchTravel(Model model, HttpServletResponse response, sysTravelBean stb) throws IOException {
        if (stb.getLegalNo() == null || stb.getLegalNo().equals("")) {
            System.out.println(stb.getPage());
            if (stb.getPage() == null) {
                PageHelper.startPage(1, 10);
            } else {
                PageHelper.startPage(stb.getPage(), 10);
            }
            List<sysTravelBean> list = p6s.searchAllTravel();
            System.out.println(list);
            PageInfo<sysTravelBean> pageInfo = new PageInfo<sysTravelBean>(list);
            System.out.println("+++" + pageInfo);
            LinkedList<Integer> ll = new LinkedList<Integer>();
            for (int i = 1; i <= pageInfo.getPages(); i++) {
                ll.add(i);
            }

            model.addAttribute("page", ll);
            model.addAttribute("list", list);
            return "user/postSix/searchTravel";
        } else {
            List<sysTravelBean> list = p6s.searchTravel(stb.getLegalNo());
            System.out.println(list);
            model.addAttribute("list", list);
            return "user/postSix/searchTravel";
        }
    }

    /**
     * 跳转到增加旅行社页面
     * 
     * @param model
     * @param response
     * @param stb
     * @return
     * @throws IOException
     */
    @RequestMapping("/jumpAddTravel")
    public String jumpAddTravel(Model model, HttpServletResponse response) throws IOException {
        return "user/postSix/addTravel";
    }

    /**
     * 增加旅行社
     * 
     * @param model
     * @param response
     * @param stb
     * @return
     * @throws Exception
     */
    @RequestMapping("/addTravel")
    public String addTravel(Model model, HttpServletResponse response, sysTravelBean stb) throws Exception {
        String source = stb.getLegalNo().substring(9, 15);
        System.out.println("\r加密前文字：\r\n" + source);
        byte[] data2 = source.getBytes();
        byte[] encodedData = RSAUtils.encryptByPublicKey(data2, RSAUtils.publicKey);
        System.out.println("加密后文字：\r\n" + encodedData.length);
        System.out.println("加密后文字：\r\n" + new String(encodedData));
        stb.setTravelPassword(encodedData);
        stb.setLegalState("正常");
        p6s.addTravel(stb);
        List<sysTravelBean> list = p6s.searchAllTravel();
        model.addAttribute("list", list);
        return "user/postSix/searchTravel";
    }

    /**
     * 跳转到更新旅行社信息页面
     * 
     * @param model
     * @param response
     * @param stb
     * @return
     * @throws IOException
     */
    @RequestMapping("/jumpChangeTravel")
    public String jumpChangeTravel(Model model, HttpServletResponse response, sysTravelBean stb) throws IOException {
        List<sysTravelBean> llist = p6s.searchTravel(stb.getLegalNo());
        sysTravelBean list = llist.get(0);
        model.addAttribute("list", list);
        return "user/postSix/changeTravel";
    }

    /**
     * 更新旅行社信息
     * 
     * @param model
     * @param response
     * @param stb
     * @return
     * @throws IOException
     */
    @RequestMapping("/changeTravel")
    public String changeTravel(Model model, HttpServletResponse response, sysTravelBean stb) throws IOException {
        p6s.changeTravel(stb);
        List<sysTravelBean> list = p6s.searchAllTravel();
        model.addAttribute("list", list);
        return "user/postSix/searchTravel";
    }

    /**
     * 删除旅行社信息
     * 
     * @param model
     * @param response
     * @param stb
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteTravel")
    public String deleteTravel(Model model, HttpServletResponse response, sysTravelBean stb) throws IOException {
        p6s.travelState(stb.getLegalNo());
        List<sysTravelBean> list = p6s.searchAllTravel();
        model.addAttribute("list", list);
        return "user/postSix/searchTravel";
    }

    /**
     * 搜索船只
     * 
     * @param model
     * @param response
     * @param dsb
     * @return
     * @throws IOException
     */
    @RequestMapping("/searchShip")
    public String searchShip(Model model, HttpServletResponse response, dataShipBean dsb) throws IOException {
        if (dsb.getShipNo() == null || dsb.getShipNo().equals("")) {
            List<dataShipBean> list = p6s.searchAllShip();
            System.out.println(list);
            model.addAttribute("list", list);
            return "user/postSix/searchShip";
        } else {
            List<dataShipBean> list = p6s.searchShip(dsb.getShipNo());
            System.out.println(list);
            model.addAttribute("list", list);
            return "user/postSix/searchShip";
        }
    }

    /**
     * 跳转到更新船只页面
     * 
     * @param model
     * @param response
     * @param dsb
     * @return
     * @throws IOException
     */
    @RequestMapping("/jumpChangeShip")
    public String jumpChangeShip(Model model, HttpServletResponse response, dataShipBean dsb) throws IOException {
        List<dataShipBean> llist = p6s.searchShip(dsb.getShipNo());
        List<dataShipBean> st = p6s.searchAllShipstate();
        dataShipBean list = llist.get(0);
        model.addAttribute("st", st);
        model.addAttribute("list", list);
        return "user/postSix/changeShip";
    }

    /**
     * 更新船只信息
     * 
     * @param model
     * @param response
     * @param stb
     * @return
     * @throws IOException
     */
    @RequestMapping("/changeShip")
    public String changeShip(Model model, HttpServletResponse response, dataShipBean dsb) throws IOException {
        System.out.println(dsb);
        p6s.changeShip(dsb);
        // String
        // dShipstate=p6s.searchShipstate(dsb.getIdt_dic_shipstate()).getdShipstate();
        List<dataShipBean> list = p6s.searchAllShip();
        model.addAttribute("list", list);
        return "user/postSix/searchShip";
    }

    /**
     * 跳转增加船只页面
     * 
     * @param model
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/jumpAddShip")
    public String jumpAddShip(Model model, HttpServletResponse response) throws IOException {
        List<dataShipBean> st = p6s.searchAllShipstate();
        model.addAttribute("st", st);
        return "user/postSix/addShip";
    }

    /**
     * 增加船只
     * 
     * @param model
     * @param response
     * @param stb
     * @return
     * @throws IOException
     */
    @RequestMapping("/addShip")
    public String addShip(Model model, HttpServletResponse response, dataShipBean dsb) throws IOException {
        p6s.addShip(dsb);
        List<dataShipBean> list = p6s.searchAllShip();
        model.addAttribute("list", list);
        return "user/postSix/searchShip";
    }

    /**
     * 删除船只信息
     * 
     * @param model
     * @param response
     * @param stb
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteShip")
    public String deleteShip(Model model, HttpServletResponse response, dataShipBean dsb) throws IOException {
        p6s.shipState(dsb.getShipNo());
        List<dataShipBean> list = p6s.searchAllShip();
        model.addAttribute("list", list);
        return "user/postSix/searchShip";
    }

    /**
     * 查找船次
     * 
     * @param model
     * @param response
     * @param dsb
     * @return
     * @throws IOException
     */
    @RequestMapping("/searchShiptime")
    public String searchShiptime(Model model, HttpServletResponse response, dataShipBean dsb) throws IOException {
        if (dsb.getShipNo() == null || dsb.getShipNo().equals("")) {
            List<dataShipBean> list = p6s.searchAllShiptime();
            System.out.println(list);
            java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日 HH:mm");// 时间转换
            List<String> startList = new ArrayList<String>();
            List<String> arrList = new ArrayList<String>();
            List<String> sellList = new ArrayList<String>();
            for (int i = 0; i < list.size(); i++) {
                dataShipBean lstart = p6s.searchPort(Integer.parseInt(list.get(i).getStartPort()));
                dataShipBean larr = p6s.searchPort(Integer.parseInt(list.get(i).getArrPort()));
                list.get(i).setStartPort(lstart.getdPort());
                list.get(i).setArrPort(larr.getdPort());
                startList.add(dateConvert.format(list.get(i).getStartTime()));
                arrList.add(dateConvert.format(list.get(i).getArrTime()));
                sellList.add(dateConvert.format(list.get(i).getSellTime()));
            }
            model.addAttribute("list", list);
            model.addAttribute("startList", startList);
            model.addAttribute("arrList", arrList);
            model.addAttribute("sellList", sellList);
            return "user/postSix/searchShiptime";
        } else {
            if (dsb.getShipState() == 0) {
                dsb.setShiptimeNo(dsb.getShipNo());
                dsb.setShipNo(null);
            }
            List<dataShipBean> list = p6s.searchShiptime(dsb);
            System.out.println(list);
            java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日 HH:mm");// 时间转换
            List<String> startList = new ArrayList<String>();
            List<String> arrList = new ArrayList<String>();
            List<String> sellList = new ArrayList<String>();
            for (int i = 0; i < list.size(); i++) {

                dataShipBean lstart = p6s.searchPort(Integer.parseInt(list.get(i).getStartPort()));
                dataShipBean larr = p6s.searchPort(Integer.parseInt(list.get(i).getArrPort()));
                list.get(i).setStartPort(lstart.getdPort());
                list.get(i).setArrPort(larr.getdPort());
                startList.add(dateConvert.format(list.get(i).getStartTime()));
                arrList.add(dateConvert.format(list.get(i).getArrTime()));
                sellList.add(dateConvert.format(list.get(i).getSellTime()));
            }
            model.addAttribute("list", list);
            model.addAttribute("startList", startList);
            model.addAttribute("arrList", arrList);
            model.addAttribute("sellList", sellList);
            return "user/postSix/searchShiptime";
        }
    }

    /**
     * 跳转增加船次页面
     * 
     * @param model
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/jumpAddShiptime")
    public String jumpAddShiptime(Model model, HttpServletResponse response) throws IOException {
        List<dataShipBean> sans = p6s.searchAllNormalShip();
        List<dataShipBean> sap = p6s.searchAllPort();
        model.addAttribute("sans", sans);
        model.addAttribute("sap", sap);
        return "user/postSix/addShiptime";
    }

    /**
     * 增加船次
     * 
     * @param model
     * @param response
     * @param stb
     * @return
     * @throws IOException
     */
    @RequestMapping("/addShiptime")
    public String addShiptime(Model model, HttpServletResponse response, dataShipBean dsb) throws IOException {
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");// 可以方便地修改日期格式
        dsb.setShiptimeNo(dateFormat.format(now));
        dsb.setShiptimeState(1);
        dsb.setStartDate(dsb.getBigDate().substring(0, 19));
        dsb.setArrDate(dsb.getBigDate().substring(22, 41));
        p6s.addShiptime(dsb);
        List<dataShipBean> list = p6s.searchAllShiptime();
        System.out.println(list);
        java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日 HH:mm");// 时间转换
        List<String> startList = new ArrayList<String>();
        List<String> arrList = new ArrayList<String>();
        List<String> sellList = new ArrayList<String>();
        for (int i = 0; i < list.size(); i++) {
            dataShipBean lstart = p6s.searchPort(Integer.parseInt(list.get(i).getStartPort()));
            dataShipBean larr = p6s.searchPort(Integer.parseInt(list.get(i).getArrPort()));
            list.get(i).setStartPort(lstart.getdPort());
            list.get(i).setArrPort(larr.getdPort());
            startList.add(dateConvert.format(list.get(i).getStartTime()));
            arrList.add(dateConvert.format(list.get(i).getArrTime()));
            sellList.add(dateConvert.format(list.get(i).getSellTime()));
        }
        model.addAttribute("list", list);
        model.addAttribute("startList", startList);
        model.addAttribute("arrList", arrList);
        model.addAttribute("sellList", sellList);
        return "user/postSix/searchShiptime";
    }

    /**
     * 跳转到更改船次
     * 
     * @param model
     * @param response
     * @param dsb
     * @return
     * @throws IOException
     */
    @RequestMapping("/jumpChangeShiptime")
    public String jumpChangeShiptime(Model model, HttpServletResponse response, dataShipBean dsb) throws IOException {
        if (dsb.getShipNo() != null) {
            dsb.setShiptimeNo(dsb.getShipNo());
            dsb.setShipNo(null);
        }
        List<dataShipBean> llist = p6s.searchShiptime(dsb);
        dataShipBean list = llist.get(0);
        List<dataShipBean> sans = p6s.searchAllNormalShip();
        List<dataShipBean> sap = p6s.searchAllPort();
        java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日 HH:mm");// 时间转换
        java.text.SimpleDateFormat dateConvert2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String start = dateConvert.format(list.getStartTime());
        String arr = dateConvert.format(list.getArrTime());
        String sell = dateConvert.format(list.getSellTime());
        dataShipBean lstart = p6s.searchPort(Integer.parseInt(list.getStartPort()));
        dataShipBean larr = p6s.searchPort(Integer.parseInt(list.getArrPort()));
        list.setStartPort(lstart.getdPort());
        list.setArrPort(larr.getdPort());
        String bigDate = dateConvert2.format(list.getStartTime()) + " - " + dateConvert2.format(list.getArrTime());
        String sellTime = dateConvert2.format(list.getSellTime());
        model.addAttribute("sans", sans);
        model.addAttribute("sap", sap);
        model.addAttribute("list", list);
        model.addAttribute("start", start);
        model.addAttribute("arr", arr);
        model.addAttribute("sell", sell);
        model.addAttribute("bigDate", bigDate);
        model.addAttribute("sellTime", sellTime);
        return "user/postSix/changeShiptime";
    }

    /**
     * 更改船次
     * 
     * @param model
     * @param response
     * @param dsb
     * @return
     * @throws IOException
     */
    @RequestMapping("/changeShiptime")
    public String changeShiptime(Model model, HttpServletResponse response, dataShipBean dsb) throws IOException {
        String shipNo = "请选择船舷";
        if (dsb.getShipNo() != "请选择船舷")// 判断是否更改了船号，更改后的值给shipNo
        {
            shipNo = dsb.getShipNo();
            dsb.setShipNo("请选择船舷");
        }
        java.text.SimpleDateFormat dateConvert0 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<dataShipBean> llist = p6s.searchShiptime(dsb);// shipNo代换主要解决search船号的矛盾
        dataShipBean lists = llist.get(0);
        dsb.setShipNo(shipNo); // 更改后的值还给要插入的数据
        // 没更改的用之前的数据替代
        if (dsb.getShipNo().equals("请选择船舷")) {
            dsb.setShipNo(lists.getShipNo());
        }
        if (dsb.getStartDate() == null) {
            dsb.setStartDate(dateConvert0.format(lists.getStartTime()));// 日期转成字符串
        }
        if (dsb.getArrDate() == null) {
            dsb.setArrDate(dateConvert0.format(lists.getArrTime()));
        }
        if (dsb.getStartPort().equals("请选择")) {
            dsb.setStartPort(lists.getStartPort());
        }
        if (dsb.getArrPort().equals("请选择")) {
            dsb.setArrPort(lists.getArrPort());
        }
        if (dsb.getSellDate().equals("")) {
            dsb.setSellDate(dateConvert0.format(lists.getSellTime()));
        }
        if (dsb.getBigDate() != "")// 拆分bigDate日期
        {
            dsb.setStartDate(dsb.getBigDate().substring(0, 19));
            dsb.setArrDate(dsb.getBigDate().substring(22, 41));
        }
        p6s.changeShiptime(dsb);
        List<dataShipBean> list = p6s.searchAllShiptime();
        java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日 HH:mm");// 时间转换
        List<String> startList = new ArrayList<String>();
        List<String> arrList = new ArrayList<String>();
        List<String> sellList = new ArrayList<String>();
        for (int i = 0; i < list.size(); i++) {
            dataShipBean lstart = p6s.searchPort(Integer.parseInt(list.get(i).getStartPort()));
            dataShipBean larr = p6s.searchPort(Integer.parseInt(list.get(i).getArrPort()));
            list.get(i).setStartPort(lstart.getdPort());
            list.get(i).setArrPort(larr.getdPort());
            startList.add(dateConvert.format(list.get(i).getStartTime()));
            arrList.add(dateConvert.format(list.get(i).getArrTime()));
            sellList.add(dateConvert.format(list.get(i).getSellTime()));
        }
        model.addAttribute("list", list);
        model.addAttribute("startList", startList);
        model.addAttribute("arrList", arrList);
        model.addAttribute("sellList", sellList);
        return "user/postSix/searchShiptime";
    }

    /**
     * 删除船次
     * 
     * @param model
     * @param response
     * @param dsb
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteShiptime")
    public String deleteShiptime(Model model, HttpServletResponse response, dataShipBean dsb) throws IOException {
        p6s.deleteShiptime(dsb.getShiptimeNo());
        List<dataShipBean> list = p6s.searchAllShiptime();
        java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日 HH:mm");// 时间转换
        List<String> startList = new ArrayList<String>();
        List<String> arrList = new ArrayList<String>();
        List<String> sellList = new ArrayList<String>();
        for (int i = 0; i < list.size(); i++) {
            dataShipBean lstart = p6s.searchPort(Integer.parseInt(list.get(i).getStartPort()));
            dataShipBean larr = p6s.searchPort(Integer.parseInt(list.get(i).getArrPort()));
            list.get(i).setStartPort(lstart.getdPort());
            list.get(i).setArrPort(larr.getdPort());
            startList.add(dateConvert.format(list.get(i).getStartTime()));
            arrList.add(dateConvert.format(list.get(i).getArrTime()));
            sellList.add(dateConvert.format(list.get(i).getSellTime()));
        }
        model.addAttribute("list", list);
        model.addAttribute("startList", startList);
        model.addAttribute("arrList", arrList);
        model.addAttribute("sellList", sellList);
        return "user/postSix/searchShiptime";
    }

    /**
     * 查找所有用户
     * 
     * @param model
     * @param response
     * @param sub
     * @return
     * @throws IOException
     */
    @RequestMapping("searchUser")
    public String searchUser(Model model, HttpServletResponse response, HttpServletRequest request, sysUserBean sub)
            throws IOException {
        List<sysUserBean> list = new ArrayList<>();
        List<String> lSex = new ArrayList<>();
        List<String> lPost = new ArrayList<>();
        List<String> lDept = new ArrayList<>();
        List<String> lBir = new ArrayList<String>();
        java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日");// 时间转换
        if (sub.getEmpNo() == null || sub.getEmpNo().equals("")) {
            list = p6s.searchAllUser();
            if (num == 0)// 判断是否需要重新写入
            {
                for (int i = 0; i < list.size(); i++)// 读取数据库中图片
                {
                    byte[] blob = list.get(i).getEmpPicture();
                    InputStream in = new ByteArrayInputStream(blob);
                    OutputStream out = new FileOutputStream(path + list.get(i).getEmpNo() + ".png");
                    int n = in.read(); // 读取流中的第一个字节数据，一次读一个字节
                    while (n != -1) {
                        out.write((byte) n);
                        n = in.read();// 读下一个
                    }
                    out.flush();
                    out.close();
                    in.close();
                }
                num++;// 计数器
            }
        } else {
            if (sub.getEmpState().equals("1")) {
                sub.setEmpName(sub.getEmpNo());
                sub.setEmpNo(null);
            }
            list = p6s.searchUser(sub);
        }
        for (int i = 0; i < list.size(); i++) {
            lSex.add(p6s.searchSex(list.get(i).getEmpSex()).getdSex());
            lPost.add(p6s.searchPost(list.get(i).getEmpPost()).getdPost());
            lDept.add(p6s.searchDept(list.get(i).getEmpDept()).getdDept());
            lBir.add(dateConvert.format(list.get(i).getEmpBirthday()));
        }
        model.addAttribute("list", list);
        model.addAttribute("lSex", lSex);
        model.addAttribute("lPost", lPost);
        model.addAttribute("lDept", lDept);
        model.addAttribute("lBir", lBir);
        return "user/postSix/searchUser";
    }

    /**
     * 跳转到增加旅客页面
     * 
     * @param model
     * @param response
     * @param request
     * @param sub
     * @return
     * @throws IOException
     */
    @RequestMapping("jumpAddUser")
    public String jumpAddUser(Model model, HttpServletResponse response, HttpServletRequest request, sysUserBean sub)
            throws IOException {
        List<sysUserBean> lSex = p6s.searchAllSex();
        List<sysUserBean> lPost = p6s.searchAllPost();
        List<sysUserBean> lDept = p6s.searchAllDept();
        model.addAttribute("lSex", lSex);
        model.addAttribute("lPost", lPost);
        model.addAttribute("lDept", lDept);
        return "user/postSix/addUser";
    }

    /**
     * 添加user
     * 
     * @param model
     * @param response
     * @param request
     * @param sub
     * @return
     * @throws IOException
     */

    @RequestMapping("addUser")
    public String addUser(Model model, HttpServletResponse response, @RequestParam("cfile") CommonsMultipartFile file,
            HttpServletRequest request, sysUserBean sub) throws Exception {
        // 获取name＝cfile文件
        // System.out.println(sub);
        // String fileName = file.getOriginalFilename();
        // System.out.println("原始文件名:" + fileName);
        String source = new String(sub.getEmpPassword());
        System.out.println("\r加密前文字：\r\n" + source);
        byte[] data2 = source.getBytes();
        byte[] encodedData = RSAUtils.encryptByPublicKey(data2, RSAUtils.publicKey);
        System.out.println("加密后文字二进制：\r\n" + encodedData);
        System.out.println("加密后文字：\r\n" + new String(encodedData));
        // byte[] decodedData = RSAUtils.decryptByPrivateKey(encodedData,
        // RSAUtils.privateKey);
        // String target = new String(decodedData);
        // System.out.println("解密后文字: \r\n" + target);
        // for(byte b:encodedData)
        // {
        // System.out.println(b);
        // }
        sub.setEmpPassword(encodedData);

        InputStream inp = file.getInputStream();
        int BUFFER_SIZE = inp.available();// inp的长度
        ByteArrayOutputStream outp = new ByteArrayOutputStream();// 空的字节输出流
        byte[] data = new byte[BUFFER_SIZE];// 空的字节
        // String
        // t=Thread.currentThread().getContextClassLoader().getResource("").getPath();
        // //获取文件绝对路径
        // int num=t.indexOf(".metadata");
        // String path="/"+t.substring(1,num)+"FYTMS/WebContent/fileUpload/";
        // FileOutputStream output = new FileOutputStream(path+"1.png");
        // System.out.println(path);
        // IOUtils.copy(inputStream, output);文件复制到fileUpload中
        // inputStream.close();
        // output.close();
        // System.out.println(inputStream);
        // p6s.addUser(sub);
        int count = -1;
        while ((count = inp.read(data, 0, BUFFER_SIZE)) != -1)// 将文件流写入字节流中
            outp.write(data, 0, count);
        outp.flush();
        outp.close();
        inp.close();
        data = null;
        sub.setEmpPicture(outp.toByteArray());// 赋值
        p6s.addUser(sub);

        // 读取数据库中文件并写入到pic中
        List<sysUserBean> list = new ArrayList<>();
        list = p6s.searchUser(sub);
        byte[] blob = list.get(0).getEmpPicture();
        InputStream in = new ByteArrayInputStream(blob);
        OutputStream out = new FileOutputStream(path + list.get(0).getEmpNo() + ".png");
        int n = in.read(); // 读取流中的第一个字节数据，一次读一个字节
        while (n != -1) {
            out.write((byte) n);
            n = in.read();// 读下一个
        }
        out.flush();
        out.close();
        in.close();

        // 寻找所有员工数据但不用读写文件
        List<String> lSex = new ArrayList<>();
        List<String> lPost = new ArrayList<>();
        List<String> lDept = new ArrayList<>();
        List<String> lBir = new ArrayList<String>();
        java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日");// 时间转换
        list = p6s.searchAllUser();
        for (int i = 0; i < list.size(); i++) {
            lSex.add(p6s.searchSex(list.get(i).getEmpSex()).getdSex());
            lPost.add(p6s.searchPost(list.get(i).getEmpPost()).getdPost());
            lDept.add(p6s.searchDept(list.get(i).getEmpDept()).getdDept());
            lBir.add(dateConvert.format(list.get(i).getEmpBirthday()));
        }
        model.addAttribute("list", list);
        model.addAttribute("lSex", lSex);
        model.addAttribute("lPost", lPost);
        model.addAttribute("lDept", lDept);
        model.addAttribute("lBir", lBir);
        return "user/postSix/searchUser";
    }

    /**
     * 跳转到更改页面
     * 
     * @param model
     * @param response
     * @param sub
     * @return
     * @throws Exception
     */
    @RequestMapping("jumpChangeUser")
    public String jumpChangeUser(Model model, HttpServletResponse response, sysUserBean sub) throws Exception {
        List<sysUserBean> l = p6s.searchUserNoPic(sub);// 加速显示时间
        sysUserBean list = l.get(0);
        java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy-MM-dd");// 时间转换
        String lBir = dateConvert.format(list.getEmpBirthday());
        String sex = p6s.searchSex(list.getEmpSex()).getdSex();
        String dept = p6s.searchDept(list.getEmpDept()).getdDept();
        String post = p6s.searchPost(list.getEmpPost()).getdPost();
        System.out.println(list);

        byte[] s = list.getEmpPassword();
        System.out.println(s.length);
        byte[] decodedData = RSAUtils.decryptByPrivateKey(s, RSAUtils.privateKey);
        String target = new String(decodedData);
        System.out.println("解密后文字: \r\n" + target);
        model.addAttribute("target", target);
        model.addAttribute("list", list);
        model.addAttribute("sex", sex);
        model.addAttribute("post", post);
        model.addAttribute("dept", dept);
        model.addAttribute("lBir", lBir);

        List<sysUserBean> lSex = p6s.searchAllSex();
        List<sysUserBean> lPost = p6s.searchAllPost();
        List<sysUserBean> lDept = p6s.searchAllDept();
        model.addAttribute("lSex", lSex);
        model.addAttribute("lPost", lPost);
        model.addAttribute("lDept", lDept);
        return "user/postSix/changeUser";

    }

    /**
     * 更改员工信息
     * 
     * @param model
     * @param response
     * @param sub
     * @return
     * @throws Exception
     */
    @RequestMapping("changeUser")
    public String changeUser(Model model, HttpServletResponse response, sysUserBean sub,
            @RequestParam("cfile") CommonsMultipartFile file) throws Exception {
        int sex = p6s.searchUser(sub).get(0).getEmpSex();
        if (sub.getEmpSex() == 0)// 性别判定
        {
            sub.setEmpSex(sex);
        }
        System.out.println(sub);
        if (sub.getEmpState().equals("1"))// 是否上传了新的图片，没上传不做更改
        {
            InputStream inp = file.getInputStream();
            int BUFFER_SIZE = inp.available();// inp的长度
            System.out.println(BUFFER_SIZE);
            ByteArrayOutputStream outp = new ByteArrayOutputStream();// 空的字节输出流
            byte[] data = new byte[BUFFER_SIZE];// 空的字节
            int count = -1;
            while ((count = inp.read(data, 0, BUFFER_SIZE)) != -1)// 将文件流写入字节流中
                outp.write(data, 0, count);
            outp.flush();
            outp.close();
            inp.close();
            data = null;
            sub.setEmpPicture(outp.toByteArray());// 赋值
            System.out.println("++++" + outp.toByteArray());

            String source = new String(sub.getEmpPassword());
            System.out.println("\r加密前文字：\r\n" + source);
            byte[] data2 = source.getBytes();
            byte[] encodedData = RSAUtils.encryptByPublicKey(data2, RSAUtils.publicKey);
            System.out.println("加密后文字：\r\n" + encodedData.length);
            System.out.println("加密后文字：\r\n" + new String(encodedData));
            // byte[] decodedData = RSAUtils.decryptByPrivateKey(encodedData,
            // RSAUtils.privateKey);
            // String target = new String(decodedData);
            // System.out.println("解密后文字: \r\n" + target);
            // for(byte b:encodedData)
            // {
            // System.out.println(b);
            // }
            sub.setEmpPassword(encodedData);

            p6s.changeUser(sub);
        } else {
            String source = new String(sub.getEmpPassword());
            System.out.println("\r加密前文字：\r\n" + source);
            byte[] data2 = source.getBytes();
            byte[] encodedData = RSAUtils.encryptByPublicKey(data2, RSAUtils.publicKey);
            System.out.println("加密后文字：\r\n" + encodedData.length);
            System.out.println("加密后文字：\r\n" + new String(encodedData));
            // byte[] decodedData = RSAUtils.decryptByPrivateKey(encodedData,
            // RSAUtils.privateKey);
            // String target = new String(decodedData);
            // System.out.println("解密后文字: \r\n" + target);
            // for(byte b:encodedData)
            // {
            // System.out.println(b);
            // }
            sub.setEmpPassword(encodedData);
            p6s.changeUserNoPic(sub);
        }

        // 读取数据库中文件并写入到pic中
        List<sysUserBean> list = new ArrayList<>();
        list = p6s.searchUser(sub);
        byte[] blob = list.get(0).getEmpPicture();
        InputStream in = new ByteArrayInputStream(blob);
        OutputStream out = new FileOutputStream(path + list.get(0).getEmpNo() + ".png");
        int n = in.read(); // 读取流中的第一个字节数据，一次读一个字节
        while (n != -1) {
            out.write((byte) n);
            n = in.read();// 读下一个
        }
        out.flush();
        out.close();
        in.close();

        // 寻找所有员工数据但不用读写文件
        List<String> lSex = new ArrayList<>();
        List<String> lPost = new ArrayList<>();
        List<String> lDept = new ArrayList<>();
        List<String> lBir = new ArrayList<String>();
        java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日");// 时间转换
        list = p6s.searchAllUser();
        for (int i = 0; i < list.size(); i++) {
            lSex.add(p6s.searchSex(list.get(i).getEmpSex()).getdSex());
            lPost.add(p6s.searchPost(list.get(i).getEmpPost()).getdPost());
            lDept.add(p6s.searchDept(list.get(i).getEmpDept()).getdDept());
            lBir.add(dateConvert.format(list.get(i).getEmpBirthday()));
        }
        model.addAttribute("list", list);
        model.addAttribute("lSex", lSex);
        model.addAttribute("lPost", lPost);
        model.addAttribute("lDept", lDept);
        model.addAttribute("lBir", lBir);
        return "user/postSix/searchUser";

    }

    /**
     * 删除用户
     * 
     * @param model
     * @param response
     * @param dsb
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteUser")
    public String deleteUser(Model model, HttpServletResponse response, sysUserBean sub) throws IOException {
        java.text.SimpleDateFormat convert = new java.text.SimpleDateFormat("yyyyMMddHHmmss");// 时间转换
        Date now = new Date();
        String s = convert.format(now) + sub.getEmpNo();
        sub.setEmpPassword(s.getBytes());// 修改主键的值防止冲突
        p6s.deleteUser(sub);
        File file = new File(path + sub.getEmpNo() + ".png");
        file.delete();// 删除相应图片

        List<sysUserBean> list = new ArrayList<>();
        list = p6s.searchUser(sub);

        List<String> lSex = new ArrayList<>();
        List<String> lPost = new ArrayList<>();
        List<String> lDept = new ArrayList<>();
        List<String> lBir = new ArrayList<String>();
        java.text.SimpleDateFormat dateConvert = new java.text.SimpleDateFormat("yyyy年MM月dd日");// 时间转换
        list = p6s.searchAllUser();
        for (int i = 0; i < list.size(); i++) {
            lSex.add(p6s.searchSex(list.get(i).getEmpSex()).getdSex());
            lPost.add(p6s.searchPost(list.get(i).getEmpPost()).getdPost());
            lDept.add(p6s.searchDept(list.get(i).getEmpDept()).getdDept());
            lBir.add(dateConvert.format(list.get(i).getEmpBirthday()));
        }
        model.addAttribute("list", list);
        model.addAttribute("lSex", lSex);
        model.addAttribute("lPost", lPost);
        model.addAttribute("lDept", lDept);
        model.addAttribute("lBir", lBir);
        return "user/postSix/searchUser";
    }

}