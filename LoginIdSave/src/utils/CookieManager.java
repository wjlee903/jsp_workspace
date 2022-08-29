package utils;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

/** Cookie를 생성, 읽기 및 지우기
 * 
 * @author lee
 * @version 1.0
 */

public class CookieManager {
	/** 로그린 아이디 cookie와 값을 받아 쿠키를 생성
	 * 
	 * @param response	서버에서 클라이언트로 전달을 위한 내장 객체 생성
	 * @param cName		cookie 명 --loginId
	 * @param cValue	cookie 값 == id
	 * @param cTime		cookie 저장 시간
	 */
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
		// HttpServletResponse jsp 에서는 내장객체 이지만 java에서는 만들어야한다. 
		Cookie cookie = new Cookie(cName, cValue);	// 쿠키 객체 생성
		cookie.setPath("/");						// 경로 지정
		cookie.setMaxAge(cTime);					// 쿠키 저장 시간 설정
		response.addCookie(cookie);					// 쿠키 추가
	}
	
	/** 생성 된 쿠키를 가져오는 메소드
	 * 
	 * @param request	클라이언트에서 서버로 요청
	 * @param cName		cookie name 
	 * @return			cookie 값 == id 반환
	 */
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		
		Cookie[] cookies = request.getCookies();	// cookie 배열 가져오기
		if(cookies !=null) {
			for(Cookie c : cookies) {				// 반복문 
				String cookieName = c.getName();	
				if(cookieName.equals(cName)) {		// 
					cookieValue = c.getValue();
				}
			}
		}
		return cookieValue;
	}

	/** 쿠키 삭제 메소드
	 * 
	 * @param response	서버가 클라이언트로 보내는 정보
	 * @param cName		cookie name
	 */
	public static void deleteCookie(HttpServletResponse response, String cName) {
	makeCookie(response, cName, "", 0);	// 쿠키 저장 시간이 0 이면 삭제됨.	
	}
	
}
