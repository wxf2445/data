package cn.com.jtang.util;
/**
 * This class can take a variable number of parameters on the command
 * line. Program execution begins with the main() method. The class
 * constructor is not invoked unless an object of type 'Class1'
 * created in the main() method.
 */
public class SoftKeyUtil
{
	/**
	 * The main entry point for the application. 
	 *
	 * @param args Array of parameters passed to the application
	 * via the command line.
	 */
	public static boolean checkKey(String path)
	{
		// TODO: Add initialization code here
		com.softkey.jsyunew3 j9=new  com.softkey.jsyunew3();
		j9.load(path);
		String DevicePath;
		 //这个用于判断系统中是否存在着加密锁。不需要是指定的加密锁,
		DevicePath=j9.FindPort(0);
		if(j9.get_LastError()!=0)
		{
			//System.out.println("未找到加密锁,请插入加密锁后，再进行操作。");
			return false;
		}
		
		{
			//读取字符串，,使用默认的读密码
			String outString;
			j9.YReadEx((short)0,(short)1, "FFFFFFFF","FFFFFFFF", DevicePath);
			short len=j9.GetBuf(0);
			outString = j9.YReadString((short)1,len, "FFFFFFFF","FFFFFFFF", DevicePath);
			if(j9.get_LastError() !=0){ 
				System.out.println("读字符串失败");return false;
			}
			if(j9.DecString(outString, "1234567890ABCDEF1234567890ABCDEF").equals("jtang-user")){
				//System.out.println("验证通过");
				return true;
			};
			return false;
		}
		
	}
	public static boolean excistKey(String path)
	{
		// TODO: Add initialization code here
		com.softkey.jsyunew3 j9=new  com.softkey.jsyunew3();
		j9.load(path);
		String DevicePath;
		 //这个用于判断系统中是否存在着加密锁。不需要是指定的加密锁,
		DevicePath=j9.FindPort(0);
		if(j9.get_LastError()!=0)
		{
			System.out.println("未找到加密锁,请插入加密锁后，再进行操作。");
			return false;
		}else{
			return true;
		}
		
		
	}
}
