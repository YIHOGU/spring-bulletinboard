package io.sejong.study.springbulletinboard.sample.entity;

import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.*;
import lombok.*;
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
    public Long boardId; //private Long boardId

    @OneToMany
    @JoinColumn(name = "boardId")
    private List<Reply> replies;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    private String content;
    private String title;

    //@WriteTimestamp
    @Column(nullable = false)
    private String wrote_at;

    private String updated_at;

    public Board(Long boardId, User user, String content, String title, String wrote_at) {
        this.boardId = boardId;
        this.user = user;
        this.content = content;
        this.title = title;
        this.wrote_at = wrote_at;
    }
}
