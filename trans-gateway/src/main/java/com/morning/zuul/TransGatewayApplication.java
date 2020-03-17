package com.morning.zuul;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@EnableZuulProxy
@EnableDiscoveryClient
@SpringBootApplication(exclude={RabbitAutoConfiguration.class})
public class TransGatewayApplication {

	 public static void main(String[] args) {
		SpringApplication.run(TransGatewayApplication.class, args);
	}
	
}
