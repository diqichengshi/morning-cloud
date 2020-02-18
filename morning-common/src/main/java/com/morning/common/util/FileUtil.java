/**
 * Copyright 2018-2020 stylefeng & fengshuonan (sn93@qq.com)
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.morning.common.util;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/**
 * NIO方式读取文件
 *
 * @author stylefeng
 * @Date 2018/1/4 23:09
 */
public class FileUtil {

    private static Logger log = LoggerFactory.getLogger(FileUtil.class);

    public static byte[] toByteArray(String filename) {

        File f = new File(filename);
        if (!f.exists()) {
            log.error("文件未找到！" + filename);
            throw new RuntimeException("FILE_NOT_FOUND");
        }
        FileChannel channel = null;
        FileInputStream fs = null;
        try {
            fs = new FileInputStream(f);
            channel = fs.getChannel();
            ByteBuffer byteBuffer = ByteBuffer.allocate((int) channel.size());
            while ((channel.read(byteBuffer)) > 0) {
                // do nothing
                // System.out.println("reading");
            }
            return byteBuffer.array();
        } catch (IOException e) {
            throw new RuntimeException("FILE_READING_ERROR");
        } finally {
            try {
                channel.close();
            } catch (IOException e) {
                throw new RuntimeException("FILE_READING_ERROR");
            }
            try {
                fs.close();
            } catch (IOException e) {
                throw new RuntimeException("FILE_READING_ERROR");
            }
        }
    }

    /**
     * 传入文件夹路径，该方法能够实现创建整个路径
     * @param path 文件夹路径，不包含文件名称及后缀名
     */
    public static void isDir(String path){
        String[] paths = path.split("/");
        String filePath = "";
        for(int i = 0 ; i < paths.length ; i++){
            if(i == 0){
                filePath = paths[0];
            }else{
                filePath += "/" + paths[i];
            }
            creatDir(filePath);
        }
    }

    /**
     * 该方法用来判断文件夹是否存在，如果不存在则创建，存在则什么都不做
     * @param filePath
     */
    public static void creatDir(String filePath){
        File file = new File(filePath);
        if(!file.exists()){
            file.mkdir();
        }
    }


    /**
     * 创建文件目录
     * @param path 文件路径
     * @throws IOException
     * @version 1.0,2015年11月23日 下午5:19:24,Liugl,Ins
     */
    public static void createDir(String path) throws IOException {
        if (StringUtils.isNotBlank(path)) {
            File file = new File(path);
            file.mkdirs();
        } else {
            throw new IOException("文件路径错误");
        }
    }

    /**
     * 创建文本文件
     * @param file
     * @throws IOException
     * @version 1.0,2015年11月23日 下午5:29:12,Liugl,Ins
     */
    public static void creatTxtFile(File file) throws IOException {
        if (!file.exists()) {
            file.createNewFile();
            System.err.println(file + "已创建！");
        }
    }

    /**
     * 文件转byte[]
     * @param filePath
     * @return
     * @version 1.0,2015年11月26日 下午7:48:39,Liugl,Ins
     */
    public static byte[] File2byte(String filePath) {
        byte[] buffer = null;
        try {
            File file = new File(filePath);
            FileInputStream fis = new FileInputStream(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] b = new byte[1024];
            int n;
            while ((n = fis.read(b)) != -1) {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return buffer;
    }

    /**
     * byte[]转文件
     * @param buf
     * @param filePath
     * @param fileName
     * @version 1.0,2015年11月26日 下午7:49:03,Liugl,Ins
     */
    public static void byte2File(byte[] buf, String filePath, String fileName) {
        BufferedOutputStream bos = null;
        FileOutputStream fos = null;
        File file = null;
        try {
            File dir = new File(filePath);
            if (!dir.exists() && dir.isDirectory()) {
                dir.mkdirs();
            }
            file = new File(filePath + File.separator + fileName);
            fos = new FileOutputStream(file);
            bos = new BufferedOutputStream(fos);
            bos.write(buf);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}