package org.g4studio.core.id.prefix;

import org.g4studio.core.id.PrefixGenerator;

/**
 * IPPrefixGenerator
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 * @see PrefixGenerator
 */
public abstract class IPPrefixGenerator implements PrefixGenerator {

	// private static final String IP;
	static {
		// try{
		// IP = InetAddress.getLocalHost().getAddress() ;
		// }catch (Exception e) {
		// ipadd = 0;
		// }

	}

	// public String create() throws CreatePrefixException {
	// return IP;
	// }

}
