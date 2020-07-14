package io.sejong.study.springbulletinboard.sample.http.req;

import lombok.Getter;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
public class BoardUpdateRequest {
  private Long boardId;
  private String content;
  private String title;
  private LocalDateTime updated_at;
}
