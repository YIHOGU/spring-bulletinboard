package io.sejong.study.springbulletinboard.sample.http.req;

import lombok.Getter;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
public class BoardUpdateRequest {

  SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
  Date time = new Date();

  private Long boardId;
  private String content;
  private String title;
  private String updated_at = format.format(time);
}
