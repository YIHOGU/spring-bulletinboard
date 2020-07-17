package io.sejong.study.springbulletinboard.sample.entity;

import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.*;
import lombok.*;
import org.apache.tomcat.jni.Local;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Getter
@Setter
@Entity
@NoArgsConstructor
//@AllArgsConstructor
public class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardId;

    @OneToMany(mappedBy = "board", cascade = CascadeType.REMOVE)
    private List<Reply> replies;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private String content;
    private String title;

    @CreationTimestamp
    @Column(nullable = false)
    private LocalDateTime wrote_at;

    @UpdateTimestamp
    @Column(nullable = false)
    private LocalDateTime updated_at;

    public Board(User user, String content, String title, LocalDateTime wrote_at) {
        this.user = user;
        this.content = content;
        this.title = title;
        this.wrote_at = wrote_at;
    }
}
