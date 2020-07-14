package io.sejong.study.springbulletinboard.sample.http.req;

import io.sejong.study.springbulletinboard.sample.entity.User;
import lombok.Getter;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
public class BoardCreateRequest {

  private Long boardId;
  private User user;
  private String content;
  private String title;
  private LocalDateTime wrote_at;
}
