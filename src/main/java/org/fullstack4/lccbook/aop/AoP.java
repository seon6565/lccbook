package org.fullstack4.lccbook.aop;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;


@Log4j2
@Component
@Aspect
public class AoP {

    @Before("within(org.fullstack4.lccbook..*)")
    public void beforeMethod(){
        log.info("메소드 시작 전===============================");

    }

//    @After("within(org.fullstack4.lccbook..*)")
//    public void afterMethod(){
//
//        log.info("메소드 끝===============================");
//    }
//
    @After("within(org.fullstack4.lccbook..*)")
    public void springAop(JoinPoint jpt){
        log.info("메소드 끝===============================");
        Signature signature = jpt.getSignature();
        log.info("===============================");
        log.info("JoinPoint 정보 출력 : ");
        log.info("실행 타입 : " + signature.getDeclaringType());
        log.info("실행 메소드 : " + signature.getName());
        log.info("===============================");
    }
}
