package com.lana;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import java.net.InetAddress;
import java.net.UnknownHostException;
@Slf4j
@SpringBootApplication
public class LanaBootApplication {

    public static void main(String[] args)  throws UnknownHostException {
        SpringApplication.run(LanaBootApplication.class, args);
        /*ConfigurableApplicationContext application = SpringApplication.run(LanaBootApplication.class, args);*/
        /*Environment env = application.getEnvironment();*/
        /*String port = env.getProperty("server.port");*/
        String ip = InetAddress.getLocalHost().getHostAddress();
        log.info("\n----------------------------------------------------------\n\t" +
                "Application Lana-Boot is running!  :\n\t" +
                "Swagger文档: \thttp://" + ip + ":" + "8081" + "/lana-boot" + "/doc.html\n" +
                "让我们开始甜蜜又苦涩的写bug环节吧！！！\n" +
                "----------------------------------------------------------");
    }

}
