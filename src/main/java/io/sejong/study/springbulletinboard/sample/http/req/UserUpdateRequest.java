package io.sejong.study.springbulletinboard.sample.http.req;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class UserUpdateRequest {
  private Long uid;
  private String name;
  private String userId;
  private String password;
  private String created_at;
}
