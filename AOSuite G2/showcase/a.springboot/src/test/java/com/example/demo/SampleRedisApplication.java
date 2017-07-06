package com.example.demo;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

@SpringBootApplication
public class SampleRedisApplication implements CommandLineRunner {

	@Autowired
	private StringRedisTemplate template;

	@Override
	public void run(String... args) throws Exception {
		ValueOperations<String, String> ops = this.template.opsForValue();
		String key = "spring.boot.redis.test";
		if (!this.template.hasKey(key)) {
			//ops.set(key, "foo");
		}
		ops.set("a", "test中国");
		template.expire("a", 5, TimeUnit.SECONDS);
		System.out.println(ops.get("a"));
		
		
		
		System.out.println("Found key " + key + ", value=" + ops.get(key));
	}

	public static void main(String[] args) throws Exception {
		// Close the context so it doesn't stay awake listening for redis
		SpringApplication.run(SampleRedisApplication.class, args).close();
	}

}
