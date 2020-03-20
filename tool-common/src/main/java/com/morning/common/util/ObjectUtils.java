package com.morning.common.util;

import java.io.*;

public class ObjectUtils {
    /**
     * 对象转Byte数组
     */
    public static byte[] toByteArray(Object obj) throws IOException {
        byte[] bytes = null;
        try (ByteArrayOutputStream bos = new ByteArrayOutputStream();
             ObjectOutputStream oos = new ObjectOutputStream(bos)) {
            oos.writeObject(obj);
            oos.flush();
            bytes = bos.toByteArray();
        }
        return bytes;
    }

    /**
     * Byte数组转对象
     */
    public static Object toObject(byte[] bytes) throws IOException, ClassNotFoundException {
        Object obj = null;
        try (ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
             ObjectInputStream ois = new ObjectInputStream(bis)) {

            obj = ois.readObject();
        }
        return obj;
    }
}
