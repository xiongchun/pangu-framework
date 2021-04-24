package org.g4studio.core.mvc.xstruts.action;

import java.io.Serializable;

/**
 * <p>
 * A class that encapsulates the error messages being reported by the
 * <code>validate()</code> method of an <code>ActionForm</code>. Validation
 * errors are either global to the entire <code>ActionForm</code> bean they are
 * associated with, or they are specific to a particular bean property (and,
 * therefore, a particular input field on the corresponding form).
 * </p>
 * 
 * <p>
 * Each individual error is described by an <code>ActionMessage</code> object,
 * which contains a message key (to be looked up in an appropriate message
 * resources database), and up to four placeholder arguments used for parametric
 * substitution in the resulting message.
 * </p>
 * 
 * <p>
 * <strong>IMPLEMENTATION NOTE</strong> - It is assumed that these objects are
 * created and manipulated only within the context of a single thread.
 * Therefore, no synchronization is required for access to internal collections.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-08-06 18:03:30 -0400 (Sat, 06 Aug 2005) $
 */
public class ActionErrors extends ActionMessages implements Serializable {
	// --------------------------------------------------------- Public Methods

	/**
	 * <p>
	 * Create an empty <code>ActionErrors</code> object.
	 * </p>
	 */
	public ActionErrors() {
		super();
	}

	/**
	 * <p>
	 * Create an <code>ActionErrors</code> object initialized with the given
	 * messages.
	 * </p>
	 * 
	 * @param messages
	 *            The messages to be initially added to this object. This
	 *            parameter can be <code>null</code>.
	 * @since Struts 1.1
	 */
	public ActionErrors(ActionErrors messages) {
		super(messages);
	}
}
