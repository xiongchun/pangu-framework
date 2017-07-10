package com.aosuite.showcase.petstore.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.context.junit4.SpringRunner;

import com.aosuite.showcase.petstore.service.PetStoreService;

@RunWith(SpringRunner.class)
@SpringBootTest(classes=PetStoreTests.class)
@ComponentScan(basePackages={"com.aosuite"}) 
public class PetStoreTests {

	@Autowired
	private PetStoreService petStoreService;
	
	@Test
	public void getPetBasicInfoEntity() {
		petStoreService.getPetBasicInfoEntity(1);
	}
	
	@Test
	public void getAvgPetAge() {
		petStoreService.getAvgPetAge();
	}

}
