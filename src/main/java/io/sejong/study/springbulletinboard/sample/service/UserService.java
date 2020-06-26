package io.sejong.study.springbulletinboard.sample.service;

import io.sejong.study.springbulletinboard.sample.entity.User;
import io.sejong.study.springbulletinboard.sample.http.req.UserCreateRequest;
import io.sejong.study.springbulletinboard.sample.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

  private final UserRepository userRepository;

  /** 생성자 의존관계 주입(DI, AOP 알아보기) 이외에도 @Autowired를 이용한 필드주입, setter 주입이 있다. */
  public UserService(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  public List<User> getAll() {
    return userRepository.findAll();
  }

  public User getOneByuid(Long uid) {
    return userRepository.findByUserId(uid);
  }

  public User createUser(UserCreateRequest request) {
    User user =
            new User(
                    request.getUserId(), request.getName(),request.getPassword(),request.getCreated_at());

    return userRepository.save(user);
  }
  /*
  public Board updateSample(SampleUpdateRequest request) {
    Board board = sampleRepository.findBySampleId(request.getSampleId());
    board.setNumber(request.getNumber());
    board.setName(request.getName());
    board.setContent(request.getContent());
    board.setTitle(request.getTitle());
    board.setWrote_at(request.getWrote_at());

    return boardRepository.save(board);
  }
  */
/*
  public void deleteuid(Long uid) {
    userRepository.deleteByuid(uid);
  }
 */
}