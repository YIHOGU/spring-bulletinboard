package io.sejong.study.springbulletinboard.sample.controller;

import io.sejong.study.springbulletinboard.sample.entity.Board;
import io.sejong.study.springbulletinboard.sample.entity.Reply;
import io.sejong.study.springbulletinboard.sample.http.req.ReplyCreateRequest;
import io.sejong.study.springbulletinboard.sample.repository.BoardRepository;
import io.sejong.study.springbulletinboard.sample.repository.ReplyRepository;
import io.sejong.study.springbulletinboard.sample.service.BoardService;
import io.sejong.study.springbulletinboard.sample.service.ReplyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReplyController {

    private final ReplyService replyService;
    private ReplyRepository replyRepository;

    public ReplyController(ReplyService replyService) {
        this.replyService = replyService;
    }

    @PostMapping("/reply/write")
    public String writeReply(Model model, @ModelAttribute ReplyCreateRequest request) {
        Reply reply = replyService.createReply(request);
//        model.addAttribute("reply_id",reply.getReplyId());
        Board board = reply.getBoard();
        model.addAttribute("board_id",board.getBoardId());

        return "redirect:/board/board-one";
    }

    @RequestMapping("/delete/reply")
    public String deleteReply(Model model, @RequestParam("reply_id") Long replyId) {
        Reply reply = replyService.getOneByReplyId(replyId);
        Board board = reply.getBoard();
        model.addAttribute("board_id",board.getBoardId());
        replyService.deleteReply(replyId);

        return "redirect:/board/board-one";
    }

}
