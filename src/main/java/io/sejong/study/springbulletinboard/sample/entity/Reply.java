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

    @ManyToOne
    @JoinColumn(name="board_id")
    private Board board;

/*    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;*/

    //@WriteTimestamp
    @Column(nullable = false)
    private String wrote_at;

    public Reply(Long replyId, Board board, String replyContent, String wrote_at) {
        this.replyId = replyId;
//        this.user = user;
        this.board = board;
        this.replyContent = replyContent;
        this.wrote_at = wrote_at;
    }
}
