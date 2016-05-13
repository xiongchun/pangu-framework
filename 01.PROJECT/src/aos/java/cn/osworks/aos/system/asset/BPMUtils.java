package cn.osworks.aos.system.asset;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;

import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.ProcessEngineConfiguration;
import org.dom4j.Document;
import org.dom4j.Element;


import cn.osworks.aos.core.asset.AOSCxt;
import cn.osworks.aos.core.asset.AOSUtils;
import cn.osworks.aos.core.asset.AOSXmlUtils;
import cn.osworks.aos.core.typewrap.Dto;
import cn.osworks.aos.core.typewrap.Dtos;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Lists;

/**
 * BPM工具类
 * 
 * @author OSWorks-XC
 */
public class BPMUtils {

	/**
	 * 将BPMN XML模型转换为BPMNModel对象
	 * 
	 * @param xmlByte
	 * @return
	 */
	public static BpmnModel xmlModel2BpmnModel(byte[] xmlByte) throws XMLStreamException {
		BpmnModel bpmnModel = null;
		if (AOSUtils.isNotEmpty(xmlByte)) {
			XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
			xmlInputFactory.setProperty("javax.xml.stream.isValidating", Boolean.FALSE);
			XMLStreamReader xmlStreamReader = xmlInputFactory.createXMLStreamReader(new ByteArrayInputStream(xmlByte),
					"utf-8");
			bpmnModel = new BpmnXMLConverter().convertToBpmnModel(xmlStreamReader);
		}
		return bpmnModel;
	}

	/**
	 * 将BPMN XML模型转换为Modeler JSON模型
	 * 
	 * @param xmlByte BPMN文件的byte流
	 * @return
	 */
	public static String xmlModel2JsonModel(byte[] xmlByte) throws XMLStreamException {
		String outJson = "";
		if (AOSUtils.isNotEmpty(xmlByte)) {
			JsonNode editorNode = new BpmnJsonConverter().convertToJson(xmlModel2BpmnModel(xmlByte));
			outJson = editorNode.toString();
		}
		return outJson;
	}

	/**
	 * 将Modeler Json模型转换为BPMNModel对象
	 * 
	 * @param jsonByte
	 * @return
	 */
	public static BpmnModel jsonModel2BpmnModel(byte[] jsonByte) throws IOException {
		BpmnModel bpmnModel = null;
		if (AOSUtils.isNotEmpty(jsonByte)) {
			JsonNode jsonNode = new ObjectMapper().readTree(jsonByte);
			bpmnModel = new BpmnJsonConverter().convertToBpmnModel(jsonNode);
		}
		return bpmnModel;
	}

	/**
	 * 将Modeler JSON模型转换为BPMN Xml模型
	 * 
	 * @param jsonByte
	 * @return
	 */
	public static String jsonModel2XmlModel(byte[] jsonByte) throws IOException {
		String outXml = "";
		if (AOSUtils.isNotEmpty(jsonByte)) {
			byte[] bpmnByte = new BpmnXMLConverter().convertToXML(jsonModel2BpmnModel(jsonByte));
			outXml = new String(bpmnByte, "utf-8");
		}
		return outXml;
	}

	/**
	 * 将BPMNModel转换为流程图
	 * 
	 * @param bpmnModel
	 *            转换对象
	 * @param actList
	 *            需高亮的节点集合
	 * @param lineList
	 *            需高亮的线条集合
	 * @return
	 */
	public static InputStream graphBPMNModel(BpmnModel bpmnModel, List<String> actList, List<String> lineList) {
		ProcessEngineConfiguration processEngineConfiguration = AOSCxt.getProcessEngine()
				.getProcessEngineConfiguration();
		if (actList == null) {
			actList = Lists.newArrayList();
		}
		if (lineList == null) {
			lineList = Lists.newArrayList();
		}
		InputStream inputStream = processEngineConfiguration.getProcessDiagramGenerator().generateDiagram(bpmnModel,
				"png", actList, lineList, processEngineConfiguration.getActivityFontName(),
				processEngineConfiguration.getLabelFontName(), null, 1f);
		return inputStream;
	}

	/**
	 * 从BPMN XML文件中解析流程信息
	 * 
	 * @param xmlBPMN
	 * @return
	 */
	public static Dto getMetaInfoFromXML(String xmlBPMN) {
		Dto outDto = Dtos.newOutDto();
		Document document = AOSXmlUtils.parse(xmlBPMN);
		Element root = document.getRootElement();
		Element elProcess = root.element("process");
		if (AOSUtils.isNotEmpty(elProcess)) {
			outDto.put("name", elProcess.valueOf("@name"));
		}
		Element elDocumentation = elProcess.element("documentation");
		if (AOSUtils.isNotEmpty(elDocumentation)) {
			outDto.put("description", elDocumentation.getTextTrim());
		}
		return outDto;
	}

}
