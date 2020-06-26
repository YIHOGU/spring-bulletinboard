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
    private String replyname;
    private Long rtob;

    //@WriteTimestamp
    @Column(nullable = false)
    private String wrote_at;

    public Reply(Long replyId, String replyContent, String replyname, Long rtob, String wrote_at) {
        this.replyId = replyId;
        this.replyContent = replyContent;
        this.replyname = replyname;
        this.rtob = rtob;
        this.wrote_at = wrote_at;
    }
}
