package com.keduit.controller;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.domain.PageDTO;
import com.keduit.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("BoardController")
@RequestMapping("/board/*")
@Log4j
@RequiredArgsConstructor
public class BoardController {
    //    @Qualifier("BoardServiceImpl")
    private final BoardService service;
    String redirect = "redirect:/board/list";

    @GetMapping("/list")
    public void list(Criteria cri, Model model) {
        log.info("Call List..........");
        int total = service.getTotalCnt(cri);
        model.addAttribute("list", service.getList(cri))
                .addAttribute("pageMaker",
                        new PageDTO(cri, total));
    }

    @GetMapping("/register")
    public void register() {
    }

    @PostMapping("/register")
    public String register(BoardVO board, RedirectAttributes rttr) {
        log.info("Call register.......");
        Long bno = service.register(board);
        log.info("Board : " + bno + " " + board);
        rttr.addFlashAttribute("result", bno);
        return redirect;
    }

    @GetMapping({"/read", "/modify"})
    public void get(@RequestParam("bno") Long bno, Model model,
                    @ModelAttribute("cri") Criteria cri) {
        log.info("Call Get read or modify.......");
        model.addAttribute("board", service.get(bno));
        model.addAttribute("pageMaker",cri);
//        @ModelAttribute("cri") Criteria cri ==  model.addAttribute("page", cri);
    }

    @PostMapping("/modify")
    public String modify(BoardVO board, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
        log.info("Call modify....... " + board);
        if (service.modify(board)) rttr.addFlashAttribute("result", "success");
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        rttr.addAttribute("type",cri.getType());
        rttr.addAttribute("keyword",cri.getKeyword());
        return redirect;
    }

    @PostMapping("/remove")
    public String remove(Long bno, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
        log.info("Call remove......");
        if (service.remove(bno)) rttr.addFlashAttribute("result", "success");
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        rttr.addAttribute("type",cri.getType());
        rttr.addAttribute("keyword",cri.getKeyword());
        return redirect;
    }
}
