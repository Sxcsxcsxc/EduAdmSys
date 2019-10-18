package frame.utils;

import java.util.UUID;

/**
 * <p>
 * 生成主键的工具类
 * </p>
 * 
 * @Copyright (C),
 * @author sxc
 * @Date:2019年9月24日
 */
public class PrimaryKeyUtil {
	/**
	 * <p>
	 * 获得一串32位的字符串
	 * </p>
	 * 
	 * @author sxc
	 * @Date 2019年9月24日
	 * @return String
	 */
	public static String getPrimaryKey() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
