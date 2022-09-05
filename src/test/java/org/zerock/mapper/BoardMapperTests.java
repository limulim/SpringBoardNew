package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper boardMapper;

	@Test
	public void testGetList() {

		log.info("---------------");
		boardMapper.getList();
	}

	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("title 테스트");
		vo.setContent("content 테스트");
		vo.setWriter("writer 테스트");

		boardMapper.insert(vo);
		log.info("-----------------");
		log.info("after insert" + vo.getBno());
	}

	@Test
	public void testInsertSelectkey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("title 테스트");
		vo.setContent("content 테스트");
		vo.setWriter("writer 테스트");

		boardMapper.insertSelectkey(vo);
		log.info("-----------------");
		log.info("after insert selectkey" + vo.getBno());
	}

	@Test
	public void testRead() {
		BoardVO vo = boardMapper.read(9L);
		log.info(vo);
	}

	@Test
	public void testDelete() {
		int count = boardMapper.delete(1L);
		log.info("count:" + count);
		
	}

	@Test
	public void testupdate() {
		BoardVO vo = new BoardVO();
		vo.setBno(9L);
		vo.setTitle("update title");
		vo.setContent("update content");
		vo.setWriter("user1111");
	
		log.info("cont: " + boardMapper.update(vo));
	}
}