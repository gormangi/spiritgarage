package com.spiritgarage.www;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SpiritgarageApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpiritgarageApplication.class, args);
	}

}
