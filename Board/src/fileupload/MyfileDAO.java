package fileupload;

import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class MyfileDAO extends DBConnPool {
	// 새로운 게시물을 입력합니다.
	public int insertFile(MyfileDTO dto) {
		int applyResult = 0;
		try {
			String query = "insert into myfile ( "
					+ " idx, name, title, cate, ofile, sfile) "
					+ " values ( "
					+ " seq_board_num.nextval, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			applyResult = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
	}
	
	// 파일 목록을 반환합니다.
	public List<MyfileDTO> myFileList() {
		List<MyfileDTO> fileList = new ArrayList<MyfileDTO>();
		
		// 쿼리문 작성
		String query = "select * from myfile order by idx desc";
		try {
			psmt = con.prepareStatement(query);		// 쿼리 준비
			rs = psmt.executeQuery();		// 쿼리 실행
			
			while (rs.next()) {		// 목록 안의 파일 수만큼 반복
				//DTO 저장
				MyfileDTO dto = new MyfileDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				
				fileList.add(dto);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("SELECT 시 예외 발생");
			e.printStackTrace();
		}
		return fileList;
	}

	
	
	
	
}
