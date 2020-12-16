package com.example.banksystem.test;


import com.example.banksystem.bean.Clerk;
import com.example.banksystem.bean.Customer;
import com.example.banksystem.dao.ClerkMapper;
import com.example.banksystem.dao.CustomerMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    ClerkMapper clerkMapper;

//    @Autowired
//    BusinessMapper businessMapper;

//    @Autowired
//    CardMapper cardMapper;

    @Autowired
    CustomerMapper customerMapper;
//
//    @Autowired
//    SqlSession sqlSession;
    /**
     * 测试clerkMapper
     */
    @Test
    public void test1() {
        clerkMapper.insertSelective(new Clerk(null, "tom1", "123456"));
    }

    @Test
    public void test2() {
        customerMapper.insertSelective(new Customer("462825199501022121","bob","15212121313","de@qq.com","m"));
    }

//    @Test
//    public void test3() {
//        cardMapper.insertSelective(new Card("1234567891234567891", "462825199501022121", new BigDecimal(Integer.toString(598))));
//    }

//    @Test
//    public void test4() {
//        businessMapper.insertSelective(new Business(null, 1, "tom", "462825199501022121", "存入", 25));
//    }
}
