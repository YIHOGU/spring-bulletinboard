package io.sejong.study.springbulletinboard.sample.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
//@AllArgsConstructor
public class Reply {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long replyId; //private Long boardId

    private String replyContent;

    private Long boardId;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    //@WriteTimestamp
    @Column(nullable = false)
    private String wrote_at;

    public Reply(Long replyId, User user, Long boardId, String replyContent, String wrote_at) {
        this.replyId = replyId;
        this.user = user;
        this.boardId = boardId;
        this.replyContent = replyContent;
        this.wrote_at = wrote_at;
    }
}
