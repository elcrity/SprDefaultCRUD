package com.keduit.service;

import com.keduit.domain.BoardVO;

import java.util.List;

public interface BoardService {

    Long register(BoardVO board);

    BoardVO get(Long bno);

    boolean modify(BoardVO board);

    boolean remove(Long bno);

    List<BoardVO> getList();
}
