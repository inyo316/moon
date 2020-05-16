package com.yi.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.BoardKindsVO;
import com.yi.domain.BoardVO;
import com.yi.domain.CafeVO;
import com.yi.domain.Criteria;
import com.yi.domain.ThemeVO;
import com.yi.domain.UsersVO;
import com.yi.domain.ZoneVO;
import com.yi.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDAOTest {
	
	@Autowired
	public BoardDAO dao;
	
	@Test
	public void testDao() {
		System.out.println("BoardDAO값 "+dao);
	}
	
	//@Test
	public void testRcInsert() throws Exception{
		BoardVO vo = new BoardVO();
		vo.setBoardNo2(new BoardKindsVO(2));
		vo.setUserNo(new UsersVO(1));
		vo.setZoneNo(new ZoneVO(1));
		vo.setThemeNo(new ThemeVO(1));
		vo.setWritingTitle("테스트제목");
		vo.setWritingContent("테스트 글내용");
		vo.setAddress("대구광역시");
		System.out.println(vo.toString());
		System.out.println(vo.getBoardNo2().getBoardNo());
		dao.recommendInsert(vo);
	}
	
//	@Test
//	public void testListBoard() throws Exception{
//		dao.recommendboardList();
//	}
//	
	
	//@Test
	public void testCafeReviewInsert() throws Exception {
		BoardKindsVO boardNo2 = new BoardKindsVO();
		boardNo2.setBoardNo(1);
		UsersVO userNo = new UsersVO();
		userNo.setUserNo(2);
		CafeVO cafeNo = new CafeVO();
		cafeNo.setCafeNo(2);
		
		BoardVO vo = new BoardVO();
		vo.setBoardNo2(boardNo2);
		vo.setUserNo(userNo);
		vo.setCafeNo(cafeNo);
		vo.setWritingTitle("탐방기 테스트");
		vo.setWritingContent("<p>탐방기 테스트</p>");
		dao.cafeReviewInsert(vo);
	}
	
	//@Test
	public void testTotalUserBoardCount() throws Exception {
		dao.totalUserBoardCount(3);
	}
	
	@Test
	public void testCafeReviesList() throws Exception {
		Criteria cri = new Criteria();
		cri.setPage(1);
		List<BoardVO> list = dao.cafeReviesList(cri);
		for(BoardVO b : list) {
			System.out.println(b);
		}
	}
}
