package io.sejong.study.springbulletinboard.sample.http.req;

import io.sejong.study.springbulletinboard.sample.entity.Board;
import io.sejong.study.springbulletinboard.sample.entity.User;
import lombok.Getter;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.util.Date;

@Getter
@Setter
public class ReplyCreateRequest {

  SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
  Date time = new Date();

  private Long replyId;
  private Board board;
  private User user;
  private String replyContent;
  private String wrote_at = format.format(time);
}
