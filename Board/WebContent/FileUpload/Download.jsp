<%@page import="utils.JSFunction"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String saveDirectory = application.getRealPath("/Uploads");
    String saveFilename = request.getParameter("sName");
    String originalFilename = request.getParameter("oName");
    
    try{
    	// 파일을 찾아 입력 스트림 생성
    	File file = new File(saveDirectory, saveFilename);
    	InputStream inStream = new FileInputStream(file);
    	
    	// 한글 파일명 깨짐 방지
    	String client = request.getHeader("User-Agent");
    	if(client.indexOf("WOW64") == -1 ) {
    		originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
    	}
    	else {
    		originalFilename = new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
    	}
    	
    	// 파일 다운로드용 응답 헤더 설정
    	response.reset();
    	response.setContentType("application/octet-stream");
    	response.setHeader("Content-Disposition", "attachment; filename=\""+originalFilename + "\"" );
    	response.setHeader("Content-Length", "" + file.length() );
    	
    	//출력 스트림 초기화
    	out.clear();
    	
    	// response 내장 객체로 부터 새로운 출력 스트림 생성
    	OutputStream outStream = response.getOutputStream();
    	
    	// 출력 스트림에 파일 내용 출력
    	//byte [] b = new byte[(int)file.length()];  // 책내용
    	byte [] b = new byte[1024*1024];	// 일반적인 버퍼 크기
    	int readBuffer = 0;
    	while( (readBuffer = inStream.read(b)) > 0) {
    		outStream.write(b, 0, readBuffer);
    	}
    	
    	// 입/출력 스트림 닫음
    	inStream.close();
    	outStream.close();    	
    }
    catch(Exception e){
    	JSFunction.alertBack("파일을 찾을수 없습니다.", out);
    }
    
    %>