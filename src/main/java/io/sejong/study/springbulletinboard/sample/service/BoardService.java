package io.sejong.study.springbulletinboard.sample.service;

import io.sejong.study.springbulletinboard.sample.entity.Board;
import io.sejong.study.springbulletinboard.sample.entity.Sample;
import io.sejong.study.springbulletinboard.sample.http.req.BoardCreateRequest;
import io.sejong.study.springbulletinboard.sample.http.req.BoardUpdateRequest;
import io.sejong.study.springbulletinboard.sample.http.req.SampleCreateRequest;
import io.sejong.study.springbulletinboard.sample.http.req.SampleUpdateRequest;
import io.sejong.study.springbulletinboard.sample.repository.BoardRepository;
import io.sejong.study.springbulletinboard.sample.repository.SampleRepository;
import org.hibernate.Hibernate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Objects;

@Service
public class BoardService {

  private final BoardRepository boardRepository;

  /** 생성자 의존관계 주입(DI, AOP 알아보기) 이외에도 @Autowired를 이용한 필드주입, setter 주입이 있다. */
  public BoardService(BoardRepository boardRepository) {
    this.boardRepository = boardRepository;
  }

  public List<Board> getAll() {
    return boardRepository.findAll();
  }

  @Transactional
  public Board getOneByBoardId(Long boardId) {

    Board board = boardRepository.findByBoardId(boardId);
    Hibernate.initialize(board.getReplies());

    return board;
  }

  public Board createBoard(BoardCreateRequest request) {
    Board board =
        new Board(
            request.getUser(), request.getContent(),request.getTitle(),request.getWrote_at());

    return boardRepository.save(board);
  }

//  @Transactional 영속성
  public Page<Board> getBoardList(Pageable pageable) {
    int page = (pageable.getPageNumber() == 0) ? 0 : (pageable.getPageNumber() - 1);
    pageable = PageRequest.of(page, 8, Sort.by("boardId").descending());

    return boardRepository.findAll(pageable);
  }

  public Board updateBoard(BoardUpdateRequest request) {
    Board board = boardRepository.findByBoardId(request.getBoardId());
    board.setContent(request.getContent());
    board.setTitle(request.getTitle());
    board.setUpdated_at(request.getUpdated_at());

    return boardRepository.save(board);
  }

  public void deleteBoard(Long boardId) {
    boardRepository.deleteById(boardId);
  }
}
