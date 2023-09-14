package com.keduit.service;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("BoardServiceImpl")
@RequiredArgsConstructor
@Log4j
@ToString

public class BoardServiceImpl implements BoardService{

    //boardMapper를 생성자 주입으로 생성받음, @RequiredArgsConstructor는 final필드를 가진 클래스에 대해 생성자를 자동으로 생성
    private final BoardMapper mapper;
    @Override
    public Long register(BoardVO board) {
        log.info(board);
        mapper.insertSelectKey(board);
        return board.getBno();
    }

    @Override
    public BoardVO get(Long bno) {
        return mapper.read(bno);
    }

    @Override
    public boolean modify(BoardVO board) {
        return mapper.update(board) == 1;
    }

    @Override
    public boolean remove(Long bno) {
        return mapper.delete(bno) == 1;
    }

//    @Override
//    public List<BoardVO> getList() {
//        return mapper.getList();
//    }

    @Override
    public List<BoardVO> getList(Criteria cri) {
        return mapper.getListWithPaging(cri);
    }

    @Override
    public int getTotalCnt(Criteria cri){
        return mapper.getTotalCnt(cri);
    }

}
