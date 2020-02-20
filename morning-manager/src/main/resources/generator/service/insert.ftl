package ${commonPackageName}.ao;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import io.swagger.annotations.ApiModelProperty;

import lombok.Data;

import java.util.Date;

/**
 * ${table.comments!""}新增记录类
 *
 * @date ${dateTime}
 * @author ${author}
 */
@Data
public class ${table.bigCamelName}AO {
    <#list columnList as item>
        <#if item.propertyName !="createTime" && item.propertyName != "id">
    /**
     * ${item.comments!""}
     */
    @ApiModelProperty(value = "${(item.comments)!""}", <#if item.nullable=="N">required = true<#else>required = false</#if>)
            <#if item.nullable=="N">
    @NotEmpty
            </#if>
            <#if item.javaType=="String">
    @Length(min = 1, max = ${item.dataLength?string('#.##')}, message = "最大长度为${item.dataLength?string('#.##')}")
                <#if (item.defaultValue)??>
    ${item.javaType} ${item.propertyName};
                <#else>
    ${item.javaType} ${item.propertyName};
                </#if>
            <#elseif item.javaType=="Long">
                <#if (item.dataPrecision)??>
    @Digits(integer = ${item.dataPrecision?string('#.##')}, fraction = ${item.dataScale?string('#.##')})
                </#if>
                <#if (item.defaultValue)??>
        ${item.javaType} ${item.propertyName};
                <#else>
    ${item.javaType} ${item.propertyName};
                </#if>
            <#else>
    ${item.javaType} ${item.propertyName};
            </#if>
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
