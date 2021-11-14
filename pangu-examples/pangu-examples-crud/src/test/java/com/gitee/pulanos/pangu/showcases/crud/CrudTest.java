package com.gitee.pulanos.pangu.showcases.crud;

import com.gitee.pulanos.pangu.showcases.crud.service.CrudService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CrudTest {

    @Autowired
    private CrudService crudService;

    @Test
    public void aInsert(){
        crudService.aInsert();
    }

    @Test
    public void aUpdate(){
        crudService.aUpdate();
    }

    @Test
    public void aDelete(){
        crudService.aDelete();
    }

    @Test
    public void aSelect(){
        crudService.aSelect();
    }

    @Test
    public void bSelect(){
        crudService.bSelect();
    }

    @Test
    public void pageQuery(){
        crudService.aPageQuery();
    }

    @Test
    public void pageQuery2(){
        crudService.bPageQuery();
    }

    @Test
    public void pageQuery3(){
        crudService.cPageQuery();
    }

}
