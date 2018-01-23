package com.anorng.bank.core.utils;

import java.util.UUID;
/**
 * 图片上传的工具类
 * @author liuxun
 *
 */
public class FileUploadUtils {

    // 得到上传文件真实名称 c:\a.txt a.txt
    // 如果参数为c:\a.txt 得到a.txt 如果为a.txt index=-1+1=0; 仍然正确
    public static String getRealName(String filename) {
        int index = filename.lastIndexOf("\\") + 1;
        return filename.substring(index);
    }

    // 获取随机名称
    public static String getUUIDFileName(String filename) {
        int index = filename.lastIndexOf(".");
        if (index != -1) {
            return UUID.randomUUID() + filename.substring(index);
        } else {
            return UUID.randomUUID().toString();
        }

    }

    // 目录分离算法
    public static String getRandomDirectory(String filename) {
        int hashcode = filename.hashCode();
        System.out.println(hashcode);

        // int数据类型在内存中占32位字节,转换成16进制数(4位)，就得到8个16进制数
        String hex = Integer.toHexString(hashcode);
        System.out.println(hex);
        return "/" + hex.charAt(0) + "/" + hex.charAt(1);

    }

}

