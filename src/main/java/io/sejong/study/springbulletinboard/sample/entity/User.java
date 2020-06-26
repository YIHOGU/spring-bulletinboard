package io.sejong.study.springbulletinboard.sample.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
//@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;

    private String name;
/*
    @OneToMany(mappedBy = "user")
    private List<Board> boards;
*/

    private String password;

    @Column(nullable = false)
    private String created_at;

    public User(Long userId, String name, String password, String created_at) {
        this.userId = userId;
        this.name = name;
        this.password = password;
        this.created_at = created_at;
    }
}