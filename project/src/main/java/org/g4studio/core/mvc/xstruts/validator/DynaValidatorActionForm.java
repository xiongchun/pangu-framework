package org.g4studio.core.mvc.xstruts.validator;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.DynaBean;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;

/**
 * <p>
 * This class extends <strong>DynaValidatorForm</strong> and provides basic
 * field validation based on an XML file. The key passed into the validator is
 * the action element's 'path' attribute from the struts-config.xml which should
 * match the form element's name attribute in the validation.xml.
 * </p>
 * 
 * <ul>
 * 
 * <li>See <code>ValidatorPlugin</code> definition in struts-config.xml for
 * validation rules.</li>
 * 
 * </ul>
 * 
 * @version $Rev: 376984 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 * @since Struts 1.1
 */
public class DynaValidatorActionForm extends DynaValidatorForm implements DynaBean, Serializable {
	/**
	 * Returns the Validation key.
	 * 
	 * @param mapping
	 *            The mapping used to select this instance
	 * @param request
	 *            The servlet request we are processing
	 * @return validation key - the action element's 'path' attribute in this
	 *         case
	 */
	public String getValidationKey(ActionMapping mapping, HttpServletRequest request) {
		return mapping.getPath();
	}
}
