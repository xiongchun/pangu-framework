package com.gitee.pulanos.pangu.framework.util;

import java.util.List;
import java.util.stream.Collectors;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.groups.Default;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.exceptions.ValidateException;

/**
 * BeanValidator Utils
 * 
 * @author xiongchun
 * @since 4.1.0
 */
public class BeanValidator {
	
	private static Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
	
	private static final int INVALID_STATUS_CODE = -999;
	
	
	/**
	 * Validates all constraints on {@code object}.
	 * <p> ValidateException if a validate error happens during the validation process
	 * @param object
	 */
	public static void validate(Object object){
		validate(object, Default.class);
	}
	
	/**
	 * Validates all constraints on {@code object}. 
	 * <p> ValidateException if a validate error happens during the validation process
	 * @param object
	 * @param groups
	 */
	public static void validate(Object object, Class<?>... groups){
		List<String> invalidMsgList = validateBean(object, groups);
		if (CollUtil.isNotEmpty(invalidMsgList)) {
			throw new ValidateException(INVALID_STATUS_CODE,  String.join(" | ", invalidMsgList));
		}
	}
	
	/**
	 * preValidate all constraints on {@code object}. 
	 * @param object
	 */
	public static void preValidate(Object object){
		preValidate(object, Default.class);
	}
	
	/**
	 * preValidate all constraints on {@code object}. 
	 * @param object
	 * @param groups
	 * @return retrun the simple validate error list
	 */
	public static List<String>preValidate(Object object, Class<?>... groups){
		return validateBean(object, groups);
	}
	
	private static List<String> validateBean(Object object, Class<?>... groups){
		return validator.validate(object, groups).stream().map(ConstraintViolation::getMessage).collect(Collectors.toList());
	}
	
}
