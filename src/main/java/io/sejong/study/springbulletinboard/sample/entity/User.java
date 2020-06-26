package io.sejong.study.springbulletinboard.sample.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
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

    @OneToMany(mappedBy = "user")
    private List<Board> boardList = new ArrayList<>();

    private String password;

    @Column(nullable = false)
    private String created_at;

    public User(Long uid, String name, String password, String created_at) {
        this.uid = uid;
        this.name = name;
        this.password = password;
        this.created_at = created_at;
    }
}