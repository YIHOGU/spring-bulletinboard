package io.sejong.study.springbulletinboard.sample.entity;

import java.time.LocalDateTime;
import javax.persistence.*;
import lombok.*;

import static java.time.LocalDateTime.now;

@Getter
@Setter
@Entity
@NoArgsConstructor
//@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long uid;

    private String name;

    private String userId;

    private String password;

    @Column(nullable = false)
    private String created_at;

    private String updated_at;

    public User(Long uid, String name, String userId, String password, String created_at) {
        this.uid = uid;
        this.name = name;
        this.userId = userId;
        this.password = password;
        this.created_at = created_at;
    }
}
