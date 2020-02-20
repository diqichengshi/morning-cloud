package com.posp.ui.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.Data;

@Data
public class FileUpload {
	 public FileUpload(String filename, byte[] file, String mimeType) {

         this.file = file;
         this.filename = filename;
         this.mimeType = mimeType;
     }

     private String filename;

     private byte[] file;

     private String mimeType;

    @Override
    public String toString() {
        return JSON.toJSONString(this,
                new SerializerFeature[] {
                        SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullListAsEmpty,
                        SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteNullNumberAsZero,
                        SerializerFeature.WriteNullBooleanAsFalse, SerializerFeature.UseISO8601DateFormat
                });
    }
}
