>本教程将简单介绍一下如何在AOSuite G1下开发Http接口，供前端Web、App或其它系统/模块调用。 数据接口交互方式很多，就不展开叙述了。这里缺省使用http协议+json序列化格式的轻量级组合作为接口交互方式。提示：更多实例请参阅范例代码 aos.showcase.api.CreditCardController.java和aos.test.testcase.HttpClientTest.java

#### §1. 发布接口及调用实例一
这种方式使用表单提交的方式来传递请求参数，Content Type为application/x-www-form-urlencoded。  
**发布接口** 
```
    /**
	 * 注册接口
	 * 
	 * 这种方式的前提是H5 Ajax的dataType:"json",contentType:"application/json"时或Android、
	 * IOS通过Http类库直接提交JSON的情况
	 * 
	 * @param jsonString
	 * @param response
	 */
	@RequestMapping(value = "register2")
	public void register2(@RequestBody String jsonString, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(jsonString);
		// 可以通过下面的API将JSON反序列化到Dto
		Dto inDto = AOSJson.fromJson(jsonString, HashDto.class);
		inDto.println();
		WebCxt.write(response, "收到数据!");
	}
```
**调用接口** 
```
    /**
	 * POST请求 以JSON参数形式提交请求
	 * (接口实现和接口调用是配套的，详见接口实现：api/creditCard/register2)
	 */
	public static void doPost2() {
		HttpRequestVO httpRequestVO = new HttpRequestVO("http://localhost:10010/AOSuite G1/api/creditCard/register2");
		httpRequestVO.setJsonEntityData("{"mobile_":"18616786188","name_":"熊春"}");
		HttpResponseVO httpResponseVO = AOSHttpClient.execute(httpRequestVO);
		System.out.println("HTTP状态码：" + httpResponseVO.getStatus());
		System.out.println("返回值：" + httpResponseVO.getOut());
	}
```

#### §2. 发布接口及调用实例二
这种方式使用表单提交的方式来传递请求参数，Content Type为application/x-www-form-urlencoded。  
**发布接口** 
```
    /**
	 * 注册接口
	 * 
	 * 这种方式的前提是H5 Ajax的dataType:"json",contentType:"application/json"时或Android、
	 * IOS通过Http类库直接提交JSON的情况
	 * 
	 * @param jsonString
	 * @param response
	 */
	@RequestMapping(value = "register2")
	public void register2(@RequestBody String jsonString, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(jsonString);
		// 可以通过下面的API将JSON反序列化到Dto
		Dto inDto = AOSJson.fromJson(jsonString, HashDto.class);
		inDto.println();
		WebCxt.write(response, "收到数据!");
	}

```
**调用接口** 
```
    /**
	 * POST请求 以JSON参数形式提交请求
	 * (接口实现和接口调用是配套的，详见接口实现：api/creditCard/register2)
	 */
	public static void doPost2() {
		HttpRequestVO httpRequestVO = new HttpRequestVO("http://localhost:10010/AOSuite G1/api/creditCard/register2");
		httpRequestVO.setJsonEntityData("{"mobile_":"18616786188","name_":"熊春"}");
		HttpResponseVO httpResponseVO = AOSHttpClient.execute(httpRequestVO);
		System.out.println("HTTP状态码：" + httpResponseVO.getStatus());
		System.out.println("返回值：" + httpResponseVO.getOut());
	} 
```

#### §3. 发布接口及调用实例三
这种方式使用表单提交的方式来传递请求参数，Content Type为application/x-www-form-urlencoded。  
**发布接口**
```
    /**
	 * resetful风格的Http接口
	 * 
	 * @param version
	 * @param id
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "info/{id}", method = RequestMethod.GET)
	public void getCardInfo(@PathVariable String version, @PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(id);
		WebCxt.write(response, "收到数据!");
	}
```

**调用接口**
```
    /**
	 * GET请求
	 */
	public static void doGet() {
		Map inMap = Maps.newHashMap();
		inMap.put("name", "熊春");
		inMap.put("age", "30");
		HttpRequestVO httpRequestVO = new HttpRequestVO("http://localhost:10010/AOSuite G1/api/creditCard/info/1000", inMap);
		httpRequestVO.setRequestMethod(AOSHttpClient.REQUEST_METHOD.GET);
		HttpResponseVO httpResponseVO = AOSHttpClient.execute(httpRequestVO);
		System.out.println("HTTP状态码：" + httpResponseVO.getStatus());
		System.out.println("返回值：" + httpResponseVO.getOut());
	}
```