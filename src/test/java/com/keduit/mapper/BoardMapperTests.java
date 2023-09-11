package com.keduit.mapper;

import com.keduit.domain.BoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;

    @Test
    public void testGetList(){
        mapper.getList().forEach(log::info);
    }
    @Test
    public void testInsert(){
        BoardVO board = new BoardVO();
        board.setTitle("6번");
        board.setContent("testInsert");
        board.setWriter("pkw");
        mapper.insert(board);
        log.info(board);
    }
    @Test
    public void testInsertSelectKey(){
        BoardVO board = new BoardVO();
        board.setTitle("8번");
        board.setContent("testInsertSelectKey2");
        board.setWriter("22222");
        mapper.insertSelectKey(board);
        log.info(board);
    }

    @Test
    public void testRead(){
        BoardVO board = mapper.read(8L);
        log.info(board);
    }

    @Test
    public void testDelete(){
        int result = mapper.delete(7L);
        log.info("itemNum : " +result);
    }

    @Test
    public void testUpdate(){
        BoardVO board = new BoardVO();
        board.setBno(1L);
        board.setTitle("업데이트 테스트");
        board.setContent("업데이트 된 텍스트");
        board.setWriter("업데이트 된 작성자");
        mapper.update(board);
        log.info(board);
    }
}
