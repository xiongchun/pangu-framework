package org.g4studio.core.id;

/**
 * SequenceStorer
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 */
public interface SequenceStorer {

	/**
	 * 保存序号
	 * 
	 * @param pSequence
	 *            序号
	 * @param pSequenceID
	 *            序号ID
	 * @throws StoreSequenceException
	 */
	public void updateMaxValueByFieldName(long pSequence, final String pSequenceID)
			throws StoreSequenceException;

	/**
	 * 
	 * @param pSequenceID
	 *            序号ID
	 * @return
	 * @throws StoreSequenceException
	 */
	public long load(final String pSequenceID) throws StoreSequenceException;
}
