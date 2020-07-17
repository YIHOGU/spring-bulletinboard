package io.sejong.study.springbulletinboard.sample.http.req;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class UserUpdateRequest {
  private Long userId;
  private String name;
  private String password;
  private LocalDateTime created_at;
}