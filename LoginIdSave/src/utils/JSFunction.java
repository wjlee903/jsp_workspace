package utils;

import javax.servlet.jsp.JspWriter;

import com.sun.jdi.Location;

/**
 * 알림창을 띄우고 지정한 url로 이동하는 기능을 수행하는 클래스
 * 
 * @author lee
 * @version 1.0
 */

public class JSFunction {

	/**
	 * 아이디가 일치하면 메시지를 알림창에 띄우고, 지정한 url로 이동한다.
	 * 
	 * @param msg 알림창에 띄우는 메시지
	 * @param url 이동할 url 주소
	 * @param out 출력을 위한 내장 객체
	 */
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "" + "<script>" + "	 alert('" + msg + "');" + "	location.href='" + url + "';" + "</script>";
			out.println(script);
		} catch (Exception e) {
		}
	}

	/**
	 * 아이디가 일치하지 않으면 메시지를 알림창에 띄우고, 지정한 url로 이동한다.
	 * 
	 * @param msg 알림창에 띄우는 메시지
	 * @param out 출력을 위한 내장 객체
	 */
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = "" + "<script>" + "	alert('" + msg + "');" + "	history.back();" + "</script>";
			out.println(script);
		} catch (Exception e) {
		} // 현재 페이지가 죽지 않도록
	}

}
