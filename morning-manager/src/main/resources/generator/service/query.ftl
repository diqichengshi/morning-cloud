package ${commonPackageName}.query;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.posp.message.common.query.PermissionPageQuery;
import io.swagger.annotations.ApiModelProperty;

import lombok.Data;

import java.util.Date;

/**
 * ${table.comments!""}查询参数类
 *
 * @date ${dateTime}
 * @author ${author}
 */
@Data
public class ${table.bigCamelName}Query extends PermissionPageQuery {
    <#list columnList as item>
    /**
     * ${item.comments!""}
     */
    <#if item.javaType=="Date">
    @ApiModelProperty(value = "${(item.comments)!""},开始时间YYYYMMDD")
    String ${item.propertyName}Start;
    @ApiModelProperty(value = "${(item.comments)!""},结束时间YYYYMMDD")
    String ${item.propertyName}End;
    <#else>
    @ApiModelProperty(value = "${(item.comments)!""}")
    ${item.javaType} ${item.propertyName};
    </#if>

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
