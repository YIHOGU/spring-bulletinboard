package io.sejong.study.springbulletinboard.sample.controller;

import io.sejong.study.springbulletinboard.sample.entity.Board;
import io.sejong.study.springbulletinboard.sample.entity.Sample;
import io.sejong.study.springbulletinboard.sample.http.req.BoardCreateRequest;
import io.sejong.study.springbulletinboard.sample.http.req.BoardUpdateRequest;
import io.sejong.study.springbulletinboard.sample.http.req.SampleCreateRequest;
import io.sejong.study.springbulletinboard.sample.http.req.SampleUpdateRequest;
import io.sejong.study.springbulletinboard.sample.model.Type;
import io.sejong.study.springbulletinboard.sample.repository.BoardRepository;
import io.sejong.study.springbulletinboard.sample.service.BoardService;
import io.sejong.study.springbulletinboard.sample.service.SampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.context.annotation.RequestScope;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class BoardController {

    private final BoardService boardService;
    private BoardRepository boardRepository;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

 /*   @RequestMapping("/board/board-all")
    public String getBoardAll(Model model) {
        List<Board> boardList = boardService.getAll();
        model.addAttribute("boardList", boardList);

        // sample-read-all.ftl 뷰를 반환한다.
        return "board-read-all";
    }*/

    /* 페이징 관련 JPA */
    @RequestMapping("/board")
    public String getBoardPaging(Model model, Pageable pageable) {
        Page<Board> boardPaging = boardService.getBoardList(pageable);
        model.addAttribute("boardPaging", boardPaging);

        return "board-read-all";
    }

    /**
     * board 단건 조회 http://localhost:8080/board/board-one?board_id={board_id}
     */
    @RequestMapping("/board/board-one")
    public String getBoardOne(Model model, @RequestParam("board_id") Long boardId) {
        Board board = boardService.getOneByBoardId(boardId);
        model.addAttribute("board", board);

        // sample-read-one.ftl 뷰를 반환한다.
        return "board-read-one";
    }

    // write인지 update인지 확인
    @RequestMapping("/board/write")
    public String controlBoard(Model model, @RequestParam Type type, @RequestParam(value="board_id", required=false) Long boardId) {
        Board board;
        if(type == Type.UPDATE) {
            board = boardService.getOneByBoardId(boardId);
            model.addAttribute("board",board);
        }
        model.addAttribute("type",type);

        return "board-write";
    }

    //Write Controller
    @RequestMapping("/write")
    public String writeBoard(Model model, @ModelAttribute BoardCreateRequest request) {
        Board board = boardService.createBoard(request);
        model.addAttribute("board_id", board.getBoardId());

        return "redirect:/board/board-one";
    }

    //Update Controller
    @RequestMapping("/update")
    public String updateBoard(Model model, @ModelAttribute BoardUpdateRequest request) {
        Board board = boardService.updateBoard(request);
        model.addAttribute("board_id",board.getBoardId());

        return "redirect:/board/board-one";
    }

    //Delete Controller
    @RequestMapping("/delete")
    public String deleteBoard(@RequestParam("board_id") Long boardId) {
        boardService.deleteBoard(boardId);

        return "redirect:/board";
    }

    @RequestMapping("/board/back")
    public String backBoardAll(Model model) {
        return "redirect:/board";
    }
}
