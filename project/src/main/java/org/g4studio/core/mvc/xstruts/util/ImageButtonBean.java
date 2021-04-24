package org.g4studio.core.mvc.xstruts.util;

import java.io.Serializable;

/**
 * A simple JavaBean to encapsulate the request parameters sent for an HTML
 * input element of type image. Such an element causes two parameters to be
 * sent, one each for the X and Y coordinates of the button press. An instance
 * of this bean within an <code>ActionForm</code> can be used to capture these
 * and provide a simple means of detecting whether or not the corresponding
 * image was selected.
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class ImageButtonBean implements Serializable {
	// ------------------------------------------------------------- Properties

	/**
	 * The X coordinate of the button press.
	 */
	private String x;

	/**
	 * The Y coordinate of the button press.
	 */
	private String y;

	// ----------------------------------------------------------- Constructors

	/**
	 * Construct an instance with empty property values.
	 */
	public ImageButtonBean() {
		; // do nothing
	}

	/**
	 * Construct an instance with the supplied property values.
	 * 
	 * @param x
	 *            The X coordinate of the button press.
	 * @param y
	 *            The Y coordinate of the button press.
	 */
	public ImageButtonBean(String x, String y) {
		this.x = x;
		this.y = y;
	}

	public String getX() {
		return (this.x);
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return (this.y);
	}

	public void setY(String y) {
		this.y = y;
	}

	// --------------------------------------------------------- Public Methods

	/**
	 * A convenience method to determine whether or not the corresponding image
	 * element was selected.
	 */
	public boolean isSelected() {
		return ((x != null) || (y != null));
	}

	/**
	 * Return a string representation of this object.
	 */
	public String toString() {
		StringBuffer sb = new StringBuffer("ImageButtonBean[");

		sb.append(this.x);
		sb.append(", ");
		sb.append(this.y);
		sb.append("]");

		return (sb.toString());
	}
}
