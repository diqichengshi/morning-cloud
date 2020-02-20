package ${commonPackageName}.entity;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import lombok.Data;

import java.util.Date;

/**
 * ${table.comments!""}表结构类
 *
 * @date ${dateTime}
 * @author ${author}
 */
@Data
public class ${table.bigCamelName}DO {

    <#list columnList as item>
    /**
     * ${item.comments!""}
     */
    ${item.javaType} ${item.propertyName};

    </#list>

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
