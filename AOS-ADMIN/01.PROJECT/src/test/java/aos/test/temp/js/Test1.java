package aos.test.temp.js;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.script.SimpleBindings;

public class Test1 {

	public static void main(String[] args) throws ScriptException {
		test5();
	}

	public static void test1() throws ScriptException {
		ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
		ScriptEngine nashorn = scriptEngineManager.getEngineByName("nashorn");
		String name = "Olli";
		// nashorn.eval("print('" + name + "')");
		nashorn.eval("print('" + name + "')");
	}

	public static void test2() throws ScriptException {
		ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
		ScriptEngine nashorn = scriptEngineManager.getEngineByName("nashorn");
		int valueIn = 10;
		SimpleBindings simpleBindings = new SimpleBindings();
		Map<String, String> map = new HashMap<>();
		map.put("a", "3");
		simpleBindings.put("map", map);
		simpleBindings.put("globalValue", valueIn);
		nashorn.eval("print (globalValue + 1)", simpleBindings);
		nashorn.eval("print (map.a + 1)", simpleBindings);
		nashorn.eval("print (test());function test(){var a1 = globalValue * 10 > 99; return a1}", simpleBindings);
		nashorn.eval(
				"print (test());function test(){var a1 = Java.type(\"java.lang.System\").currentTimeMillis(); return a1}");
		nashorn.eval("print (Java.type(\"java.lang.System\").currentTimeMillis())");
		System.out.println(nashorn.eval("print (globalValue + 1)", simpleBindings));
	}

	public static void test3() throws ScriptException {
		ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
		ScriptEngine nashorn = scriptEngineManager.getEngineByName("nashorn");
		nashorn.eval("var String = Java.type(\"java.lang.String\")");
		nashorn.eval("var str = new String(\"Hello\")");
		nashorn.eval("var upper = str.toUpperCase()");
		nashorn.eval("print (upper.indexOf('E'))");
		nashorn.eval("Java.type('java.lang.System').out.println(10)");
		Double aInteger = (Double) nashorn.eval("function f() { return 1; }; f() + 10;");
		System.out.println(aInteger);
		nashorn.eval("function sum(a, b) { return a + b; }");
		System.out.println(nashorn.eval("sum(1, 2);"));
	}

	public static void test4() throws ScriptException, FileNotFoundException, NoSuchMethodException {
		ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
		ScriptEngine nashorn = scriptEngineManager.getEngineByName("nashorn");
		Invocable invocable = (Invocable) nashorn;
		nashorn.eval(new FileReader("src/test.js"));
		System.out.println(invocable.invokeFunction("test", 1, 2));
		System.out.println(nashorn.eval("test(1,2)"));
	}

	
	public static void test5() throws ScriptException {
		ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
		ScriptEngine nashorn = scriptEngineManager.getEngineByName("nashorn");
		nashorn.eval("var DemoService = Java.type('aos.system.modules.demo.DemoService')");
		nashorn.eval("var demoService = new DemoService();");
		nashorn.eval("demoService.demo2('HY');");
		nashorn.eval("demoService.demo3('MW');");
		//静态方法
		nashorn.eval("Java.type('aos.system.modules.demo.DemoService').demo1('MW')");
		System.out.println("-----------------------------------------");
		nashorn.eval("demoService.demo2('HY');demoService.demo3('MW');");
		}

}
