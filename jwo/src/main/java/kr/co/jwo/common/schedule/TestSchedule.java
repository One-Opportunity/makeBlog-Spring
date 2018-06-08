package kr.co.jwo.common.schedule;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class TestSchedule {
	
	
	// cron = "0 0 02 * * ?" 매일 새벽 2시에 실행
	// fixedDelay = 1000*5  5초마다 실행
	@Scheduled(fixedDelay = 1000*5)
	public void test() {
		log.debug("나 계속 실행되니?");
	}
}
