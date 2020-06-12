package io.sejong.study.springbulletinboard.sample.repository;

import io.sejong.study.springbulletinboard.sample.entity.Board;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardRepository extends JpaRepository<Board, Long> {
  List<Board> findAll();

  Board findByBoardId(Long boardId);

  Page<Board> findAll(Pageable pageable);
}
