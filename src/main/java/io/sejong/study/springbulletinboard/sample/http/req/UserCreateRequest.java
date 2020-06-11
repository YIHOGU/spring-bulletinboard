package io.sejong.study.springbulletinboard.sample.http.req;

import lombok.Getter;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
public class UserCreateRequest {

  SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
  Date time = new Date();

  private Long uid;
  private String name;
  private String userId;
  private String password;
  private String created_at = format.format(time);
}