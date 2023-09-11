package com.keduit.service;

import com.keduit.domain.BoardVO;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import static org.junit.Assert.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class ServiceTests {
    @Autowired
    private BoardService service;

    @Test
    public void testExist(){
        log.info(service);
        assertNotNull(service);
    }

    @Test
    public void testRegister(){
        BoardVO board = new BoardVO();
        board.setTitle("서비스 레지스터2");
        board.setContent("서비스 레지스터 내용2");
        board.setWriter("서비스 라이터2");
        Long result = service.register(board);
        log.info("생성된 게시물 번호 : " + result);
    }

    @Test
    public void testGet() {
        assertNotNull(service.get(1L));
    }

    @Test
    public void testModify() {
        BoardVO board = new BoardVO();
        board.setTitle("service Modify");
        board.setContent("service Modify Content");
        board.setWriter("modify Writer");
        board.setBno(2L);
        boolean result = service.modify(board);
        log.info(result ? "수정 성공" : "수정 실패");
    }

    @Test
    public void testRemove() {
        boolean result = service.remove(3L);
        log.info(result ? "삭제 성공" : "삭제 실패");
    }

    @Test
    public void testGetList() {
        service.getList().forEach(log::info);
    }
}
