package com.keduit.controller;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@WebAppConfiguration
@Log4j
public class BoardControllerTests {
    //컨트롤러 테스트용 목업 설정
    @Setter(onMethod_ = @Autowired)
    private WebApplicationContext ctx;
    private MockMvc mockMvc;

    @Before//테스트 하기 전 실행하고 테스트 진행
    public void setUp() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    @Autowired
    BoardController controller;

    @Test
    public void testList() throws Exception {
        log.info("Model&View : " + mockMvc.perform(MockMvcRequestBuilders
                        .get("/board/list"))
                .andReturn()
                .getModelAndView()
                .getModelMap());
    }

    @Test
    public void testListPaging() throws Exception {
        log.info("Model&View : " + mockMvc.perform(MockMvcRequestBuilders
                        .get("/board/list")
                        .param("pageNum" , "4")
                        .param("amount", "10"))
                .andReturn()
                .getModelAndView()
                .getModelMap());
    }
    @Test
    public void testRegister() throws Exception {
        String resultPage = mockMvc
                .perform(MockMvcRequestBuilders
                        .post("/board/register")
                        .param("title","제-목")
                        .param("content","내-용")
                        .param("writer", "작성자")
                ).andReturn().getModelAndView().getViewName();

        log.info("View : " + resultPage);
    }

    @Test
    public void testRead() throws Exception {
        log.info(mockMvc.perform(MockMvcRequestBuilders
                        .get("/board/read")
                        .param("bno", "2")
                ).andReturn().getModelAndView().getModelMap());
    }

    @Test
    public  void testModify() throws Exception {
        log.info(mockMvc.perform(MockMvcRequestBuilders
                .post("/board/modify")
                .param("bno", "2")
                .param("title","modifyTest")
                .param("content", "modifycontent")
                .param("writer" , "modifyWriter11")
        ).andReturn().getModelAndView().getViewName());
    }

    @Test
    public void testRemove() throws Exception{
        log.info(mockMvc.perform(MockMvcRequestBuilders
                .post("/board/remove")
                .param("bno","22"))
                .andReturn().getModelAndView().getViewName());

    }
}
