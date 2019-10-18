package frame.utils;

import org.apache.shiro.crypto.hash.SimpleHash;

public class CreatMd5Pwd {
	/**
	 * <p>
	 * 生成Md5加密的密码密文
	 * </p>
	 * @author sxc
	 * @Date 2019年10月14日
	 * @param UserName
	 * @param pwd
	 * @return Md5Pwd
	 */
	public static String GetMd5Pwd(String UserName , String pwd){
		Object obj = new SimpleHash("MD5", pwd, UserName, 1024); 
		String Md5Pwd =obj.toString();
		return Md5Pwd;
	}
}
