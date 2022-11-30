/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
