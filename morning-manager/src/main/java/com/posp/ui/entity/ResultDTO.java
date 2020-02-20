package com.posp.ui.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import lombok.Data;

/**
 * 页面返回类
 *
 * @version v1.0.1, 2018/09/06  01:50:21 下午
 * @author 高峰
 */
@Data
public class ResultDTO {
    Integer code;
    String  msg;
    Object  data;
    Long    count;

    /**
     * 快速构造方法,操作失败,默认返回码以及返回信息
     *
     * @return
     * @version v1.0.1, 2018/09/06  01:49:20 下午
     * @author 高峰
     */
    public static ResultDTO error() {
        ResultDTO resultDTO = new ResultDTO();
        resultDTO.setCode(500);
        resultDTO.setMsg("异常，请联系管理员");
        return resultDTO;
    }

    /**
     * 快速构造方法,操作失败，固定返回码，可设置返回信息
     *
     * @param msg
     * @return
     * @version v1.0.1, 2018/09/06  01:49:20 下午
     * @author 高峰
     */
    public static ResultDTO error(String msg) {
        ResultDTO resultDTO = new ResultDTO();
        resultDTO.setCode(500);
        resultDTO.setMsg(msg);
        return resultDTO;
    }

    /**
     * 快速构造方法,操作成功
     *
     * @return
     * @version v1.0.1, 2018/09/06  01:49:20 下午
     * @author 高峰
     */
    public static ResultDTO ok() {
        ResultDTO resultDTO = new ResultDTO();
        resultDTO.setCode(0);
        resultDTO.setMsg("操作成功");
        return resultDTO;
    }
    @Override
    public String toString() {
        return JSON.toJSONString(this,
                                 new SerializerFeature[] {
            SerializerFeature.WriteMapNullValue, SerializerFeature.WriteNullListAsEmpty,
            SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteNullNumberAsZero,
            SerializerFeature.WriteNullBooleanAsFalse, SerializerFeature.UseISO8601DateFormat
        });
    }

    /**
     * 设置记录总数，分页时配合table组件显示
     *
     * @param count
     * @return
     * @version v1.0.1, 2018/09/06  01:49:20 下午
     * @author 高峰
     */
    public ResultDTO setCount(Long count) {
        this.count = count;
        return this;
    }

    /**
     * 设置返回数据
     *
     * @param list
     * @return
     * @version v1.0.1, 2018/09/06  01:49:20 下午
     * @author 高峰
     */
    public ResultDTO setData(Object list) {
        this.data = list;
        return this;
    }

    /**
     * 设置返回码以及返回信息
     *
     * @param code
     * @param msg
     * @return
     * @version v1.0.1, 2018/09/06  01:49:20 下午
     * @author 高峰
     */
    public ResultDTO setErrorMsg(Integer code, String msg) {
        this.setCode(code);
        this.setMsg(msg);
        return this;
    }
}
