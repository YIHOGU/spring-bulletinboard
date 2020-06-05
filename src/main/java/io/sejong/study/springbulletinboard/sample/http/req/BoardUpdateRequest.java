package io.sejong.study.springbulletinboard.sample.http.req;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class BoardUpdateRequest {
  private Long boardId;
  private String name;
  private String content;
  private String title;
  private LocalDateTime wrote_at;
}
