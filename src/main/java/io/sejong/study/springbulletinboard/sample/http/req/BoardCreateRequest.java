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

  SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
  Date time = new Date();

  private Long boardId;
  private User user;
  private String content;
  private String title;
  private String wrote_at = format.format(time);
}
