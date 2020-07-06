package io.sejong.study.springbulletinboard.sample.service;

import io.sejong.study.springbulletinboard.sample.entity.Board;
import io.sejong.study.springbulletinboard.sample.entity.Reply;
import io.sejong.study.springbulletinboard.sample.http.req.BoardCreateRequest;
import io.sejong.study.springbulletinboard.sample.http.req.BoardUpdateRequest;
import io.sejong.study.springbulletinboard.sample.http.req.ReplyCreateRequest;
import io.sejong.study.springbulletinboard.sample.http.req.ReplyUpdateRequest;
import io.sejong.study.springbulletinboard.sample.repository.BoardRepository;
import io.sejong.study.springbulletinboard.sample.repository.ReplyRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ReplyService {

  private final ReplyRepository replyRepository;

  /** 생성자 의존관계 주입(DI, AOP 알아보기) 이외에도 @Autowired를 이용한 필드주입, setter 주입이 있다. */
  public ReplyService(ReplyRepository replyRepository) { this.replyRepository = replyRepository; }

  public List<Reply> getAll() {
    return replyRepository.findAll();
  }

  public Reply getOneByBoardId(Long replyId) {
    return replyRepository.findByReplyId(replyId);
  }

  public Reply createReply(ReplyCreateRequest request) {
    Reply reply =
        new Reply(
            request.getReplyId(),request.getUser(),request.getBoardId(), request.getReplyContent(),request.getWrote_at());

    return replyRepository.save(reply);
  }

/*  public Reply updateReply(ReplyUpdateRequest request) {
    Reply reply = replyRepository.findByBoardId(request.getBoardId());
    reply.setContent(request.getContent());
    reply.setTitle(request.getTitle());
    reply.setUpdated_at(request.getUpdated_at());

    return replyRepository.save(reply);
  }*/

  public void deleteReply(Long replyId) {
    replyRepository.deleteById(replyId);
  }
}
