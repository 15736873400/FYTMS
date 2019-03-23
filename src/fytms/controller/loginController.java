package fytms.controller;


import javax.crypto.BadPaddingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fytms.bean.sysTravelBean;
import fytms.bean.sysUserBean;
import fytms.convert.RSAUtils;
import fytms.service.loginService;;

@Controller
@RequestMapping("/login")
public class loginController {
    @Autowired
    private loginService ls;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request,Model model, @RequestParam String name,@RequestParam String password, @RequestParam int selectNo) throws Exception {
        
        
        if (selectNo == 1) {
            try {
            	sysUserBean lb=ls.loginByEmpNo(name);
                byte[] s = lb.getEmpPassword();// 获取RSA加密的数据
                byte[] decodedData = RSAUtils.decryptByPrivateKey(s, RSAUtils.privateKey);// RSA解密
                String target = new String(decodedData);
                model.addAttribute("emp", lb);
                if (target.equals(password)&&lb.getEmpPost()==1) {
                    return "user/post1Index";
                }
                if (target.equals(password)&&lb.getEmpPost()==2) {
                    return "user/post2Index";
                }
                if (target.equals(password)&&lb.getEmpPost()==3) {
                    return "user/post3Index";
                }
                if (target.equals(password)&&lb.getEmpPost()==4) {
                	request.getSession().setAttribute("user", lb);//session
               
                	return "user/postFour/post4Index";
                }
                if (target.equals(password)&&lb.getEmpPost()==5) {
                    return "user/post5Index";
                }
                if (target.equals(password)&&lb.getEmpPost()==6) {
                    return "user/post6Index";
                }
               
                
                else
                    return "wronglogin";
            } catch (BadPaddingException e) {
                return "wronglogin";
            } catch (NullPointerException e2) {
                return "wronglogin";
            }
        } else if (selectNo == 2) {
            try {
                sysTravelBean travel = ls.loginByLegalNo(name);
                model.addAttribute("travel", travel);
                byte[] s = travel.getTravelPassword();// 获取RSA加密的数据
                byte[] decodedData = RSAUtils.decryptByPrivateKey(s, RSAUtils.privateKey);// RSA解密
                String target = new String(decodedData);
                if (target.equals(password)) {
                    return "travel/travelIndex";
                }
            } catch (BadPaddingException e) {
                return "wronglogin";
            } catch (NullPointerException e2) {
                return "wronglogin";
            }
        }
        return "wronglogin";
    }
}