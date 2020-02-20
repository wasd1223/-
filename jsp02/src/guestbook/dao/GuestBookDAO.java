package guestbook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import guestbook.dto.GuestBookDTO;
import sqlmap.MybatisManager;

public class GuestBookDAO {
	public List<GuestBookDTO> getList(String searchkey, String search){
		//mybatis 실행 객체
		SqlSession session=MybatisManager.getInstance().openSession();
		List<GuestBookDTO> list=null;
		if(searchkey.equals("name_content")) {//이름+내용
			list=session.selectList("gbListAll","%"+search+"%");
		}else {
			//mybatis의 method에는 2개 이상의 parameter를 전달할 수 없음
			Map<String,String> map=new HashMap<>();
			map.put("searchkey", searchkey);
			map.put("search", "%"+search+"%");
			list=session.selectList("gbList",map);
		}
				
		//selectList("네임스페이스.아이디")-네임스페이스는 생략가능
		
		//줄바꿈 및 특수문자 처리기능 추가
		for(GuestBookDTO dto : list) {
			String content=dto.getContent();
			content=content.replace("<", "&lt");
			content=content.replace(">", "&gt");
			content=content.replace("\n", "<br>");
			content=content.replace("  ", "&nbsp;&nbsp;");
			//키워드 색상 처리
			if(!searchkey.equals("name")) {
				content=content.replace(search, "<span style='color:red'>"+search+"</span>");
			}
			dto.setContent(content);
		}
		session.close();
		return list;
	}

	//방명록 insert
	public void gbInsert(GuestBookDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.insert("gbInsert", dto);
		session.commit();
		session.close();
	}

	public boolean passwdCheck(int idx, String passwd) {
		boolean result=false;
		//mybatis 실행 객체
		SqlSession session=MybatisManager.getInstance().openSession();
	    GuestBookDTO dto=new GuestBookDTO();
	    dto.setIdx(idx);
	    dto.setPasswd(passwd);
	    //레코드가 1개가 리턴될 경우 selectOne
	    int count=session.selectOne("passwdCheck", dto);
	    session.close();
	    if(count==1) {
	    	result=true;
	    }
		return result;
	}//passwdCheck()
	
	//게시물의 상세정보 (idx: 게시물 번호)
	public GuestBookDTO gbDetail(int idx) {
		GuestBookDTO dto=new GuestBookDTO();
		SqlSession session=MybatisManager.getInstance().openSession();
		dto = session.selectOne("gbDetail", idx);
		session.close();
		return dto;
	}//gbDetail()

	//게시물 수정
	public void gbUpdate(GuestBookDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("guestbook.gbUpdate", dto);
		session.commit();
		session.close();
	}

	//게시물 삭제
	public void gbDelete(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("guestbook.gbDelete", idx);
		session.commit();
		session.close();
		
	}
	
}
