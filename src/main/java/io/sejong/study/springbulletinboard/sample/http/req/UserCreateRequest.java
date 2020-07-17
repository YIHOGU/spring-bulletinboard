package io.sejong.study.springbulletinboard.sample.http.req;

import lombok.Getter;
import lombok.Setter;
import org.apache.tomcat.jni.Local;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
public class UserCreateRequest {

  private Long userId;
  private String name;
  private String password;
  private LocalDateTime created_at;
}