package com.keduit.mapper;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;

import java.util.List;

public interface BoardMapper {
//    @Select("select * from board where bno>0")
    List<BoardVO> getList();
    List<BoardVO> getListWithPaging(Criteria cri);
    void insert(BoardVO board);

    void insertSelectKey(BoardVO board);

    BoardVO read(long bno);

    int delete(long bno);

    int update(BoardVO board);

    int getTotalCnt(Criteria cri);
}
