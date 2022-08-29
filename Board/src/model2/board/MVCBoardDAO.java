package model2.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;


public class MVCBoardDAO extends DBConnPool{

	//전체글수
	public int selectCount(Map<String,Object> map) {
		int totalCount=0;
		//dynamic query
		String query="select count(*) from mvcboard";
		if(map.get("searchWord")!=null) {
			query+=" where "+map.get("searchField")+""
					+ " like '%"+map.get("searchWord")+"%'";
		}
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
			if(rs.next()) {
				totalCount=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("에러발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//페이징처리
	public List<MVCBoardDTO> selectListPage(Map<String,Object> map){
		List<MVCBoardDTO> board=new ArrayList<MVCBoardDTO>();
		String query="select * from ( "
				+ " 	select tb.*, rownum rNum from ( "
				+ "			select * from mvcboard ";
		if(map.get("searchWord")!=null) {
			query+=" where "+map.get("searchField")+""
					+ " like '%"+map.get("searchWord")+"%' ";
		}
		query+=" 		order by idx desc "
				+ "		) tb "
				+ " ) "
				+ " where rNum between ? and ?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs=psmt.executeQuery();
			while(rs.next()) {
				MVCBoardDTO dto=new MVCBoardDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getInt("visitcount"));
				board.add(dto);
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	//글등록
	public int insertWrite(MVCBoardDTO dto) {
		int result=0;
		try {
			String query="insert into mvcboard(idx,name,title,content,ofile,sfile,pass) "
					+ " values(seq_board_num.nextval,?,?,?,?,?,?)";
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			result=psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//다운로드횟수 증가
	public void downCountPlus(String idx) {
		String query="update mvcboard set "
				+ " downcount=downcount+1 "
				+ " where idx=?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, idx);	
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//상세보기
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto=new MVCBoardDTO();
		String query="select * from mvcboard where idx=?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, idx);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getInt("visitcount"));				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	//조회수증가
	public void updateVistitCount(String idx) {
		String query="update mvcboard set "
				+ " visitcount=visitcount+1 "
				+ " where idx=?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, idx);	
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//비밀번호확인
	public boolean confirmPassword(String pass,String idx) {
		boolean isCorr=true;
		String query="select count(*) from mvcboard where pass=? and idx=?";		
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
			if(rs.next()) {
				//totalCount=rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("에러발생");
			e.printStackTrace();
		}
		return isCorr;
	}
	//게시글 데이터를 받아 DB에 저장되어 있던 내용을 갱신합니다. (파일 업로드 지원)
	public int updatePost(MVCBoardDTO dto) {
		int result = 0;
		try {
			// 쿼리문 템플릿 작성
			String query = "update mvcboard"
					+ " set title=?, name=?, content=?, ofile=?, sfile=? "
					+ " where idx=? and pass=?";
			// 쿼리문 준비
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			
			//쿼리문 싱행
			result = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
 // 지정한 일련번호의 게시물을 삭제합니다.
    public int deletePost(String idx) {
        int result = 0;
        try {
            String query = "DELETE FROM mvcboard WHERE idx=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
	
	
	
	
}
