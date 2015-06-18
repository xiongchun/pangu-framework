package org.g4studio.core.id;

/**
 * SequenceGenerator 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 */
public interface SequenceGenerator {
	public long next() throws CreateSequnceException;
}
