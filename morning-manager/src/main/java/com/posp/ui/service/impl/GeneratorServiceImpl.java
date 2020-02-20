package com.posp.ui.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import com.posp.ui.service.ITableColumnService;
import com.posp.ui.service.ITableService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.posp.common.service.user.entyty.DbTableColumnDO;
import com.posp.common.service.user.entyty.DbTableDO;
import com.posp.message.common.dto.RespMsgDTO;
import com.posp.message.common.exception.PospBusinessException;
import com.posp.tool.common.data.UuidUtil;
import com.posp.tool.common.string.CamelNameUtil;
import com.posp.tool.common.time.DateTimeUtil;
import com.posp.ui.service.IGeneratorService;
import com.posp.ui.util.ShiroUtil;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

/**
 * 代码生成服务实现类
 *
 * @author gaofeng
 * @version v1.0.1, 2018/09/01 06:30:11 下午
 */
@Service
@Slf4j
public class GeneratorServiceImpl implements IGeneratorService {
    @Autowired
    private ITableService tableService;
    @Autowired
    private ITableColumnService tableColumnService;
    @Autowired
    private Configuration configuration;

    /**
     * 生成服务相关的文件,mapper.xml,controller,service,dao,entity,query，ao等文件
     *
     * @param model        参数map
     * @param templateName ftl模板名称
     * @param pageName     页面名称
     * @param zip          zip对象
     * @throws PospBusinessException
     * @version v1.0.1, 2018/09/04 11:40:50 下午
     * @author gaofeng
     */
    void genService(Map<String, Object> model, String templateName, String pageName, ZipOutputStream zip)
            throws PospBusinessException {
        String fileName = null;
        if (templateName.indexOf("service/xml.ftl") != -1) {
            fileName = "mapper" + File.separator + pageName;
        } else if (templateName.indexOf("service/controller.ftl") != -1) {
            fileName = "web" + File.separator + pageName;
        } else if (templateName.indexOf("service/service.ftl") != -1) {
            fileName = "service" + File.separator + pageName;
        } else if (templateName.indexOf("service/serviceImpl.ftl") != -1) {
            fileName = "service" + File.separator + "impl" + File.separator + pageName;
        } else if (templateName.indexOf("service/mapper.ftl") != -1) {
            fileName = "dao" + File.separator + pageName;
        } else if (templateName.indexOf("service/insert.ftl") != -1) {
            fileName = "ao" + File.separator + pageName;
        } else if (templateName.indexOf("service/update.ftl") != -1) {
            fileName = "bo" + File.separator + pageName;
        } else if (templateName.indexOf("service/entity.ftl") != -1) {
            fileName = "entity" + File.separator + pageName;
        } else if (templateName.indexOf("service/query.ftl") != -1) {
            fileName = "query" + File.separator + pageName;
        } else {
            fileName = pageName;
        }
        generator(model, fileName, templateName, zip);
    }

    /**
     * 生成菜单sql
     *
     * @param model
     * @param templateName
     * @param pageName
     * @param zip
     * @throws PospBusinessException
     * @version v1.0.1, 2018/09/22 11:53:47 下午
     * @author gaofeng
     */
    void genSql(Map<String, Object> model, String templateName, String pageName, ZipOutputStream zip)
            throws PospBusinessException {
        // 目录id
        model.put("uuid0", UuidUtil.getUuid());
        // 菜单id
        model.put("uuid1", UuidUtil.getUuid());
        // 详情按钮id
        model.put("uuid2", UuidUtil.getUuid());
        // 新增按钮id
        model.put("uuid3", UuidUtil.getUuid());
        // 修改按钮id
        model.put("uuid4", UuidUtil.getUuid());
        // 删除按钮id
        model.put("uuid5", UuidUtil.getUuid());
        // 批量删除按钮id
        model.put("uuid6", UuidUtil.getUuid());
        generator(model, pageName, templateName, zip);
    }

    /**
     * 生成ui相关的页面,js，controller，feign等源码文件
     *
     * @param model        参数map
     * @param templateName ftl模板名称
     * @param pageName     页面名称
     * @param zip          zip对象
     * @throws PospBusinessException
     */
    void genUi(Map<String, Object> model, String templateName, String pageName, ZipOutputStream zip)
            throws PospBusinessException {
        DbTableDO table = (DbTableDO) model.get("table");
        String fileName = null;
        if ((templateName.indexOf("list.ftl") != -1)
                || (templateName.indexOf("detail.ftl") != -1)
                || (templateName.indexOf("add.ftl") != -1)
                || (templateName.indexOf("edit.ftl") != -1)) {
            fileName = "ui" + File.separator + "templates" + File.separator + table.getSmallCamelName()
                    + File.separator + pageName;
        } else if (templateName.indexOf("js.ftl") != -1) {
            fileName = "ui" + File.separator + "modules" + File.separator + pageName;
        } else if (templateName.indexOf("controller.ftl") != -1) {
            fileName = "ui" + File.separator + "web" + File.separator + pageName;
        } else if (templateName.indexOf("feign.ftl") != -1) {
            fileName = "ui" + File.separator + "feign" + File.separator + pageName;
        } else if (templateName.indexOf("hystrix.ftl") != -1) {
            fileName = "ui" + File.separator + "feign" + File.separator + "impl" + File.separator + pageName;
        } else {
            fileName = "ui" + File.separator + table.getSmallCamelName() + File.separator + pageName;
        }
        generator(model, fileName, templateName, zip);
    }

    /**
     * 渲染并生成单个文件
     *
     * @param model
     * @param fileName
     * @param templateName
     * @param zip
     * @throws PospBusinessException
     */
    void generator(Map<String, Object> model, String fileName, String templateName, ZipOutputStream zip)
            throws PospBusinessException {
        StringWriter sw = new StringWriter();
        try {
            Template template = configuration.getTemplate(templateName);
            template.process(model, sw);
            zip.putNextEntry(new ZipEntry(fileName));
            IOUtils.write(sw.toString(), zip, "UTF-8");
            IOUtils.closeQuietly(sw);
            zip.closeEntry();
        } catch (IOException e) {
            throw new PospBusinessException("渲染模板IO失败,文件:" + fileName, e);
        } catch (TemplateException e) {
            throw new PospBusinessException("渲染模板失败,文件:" + fileName, e);
        }
    }

    /**
     * 生成库表对应的所有文件
     *
     * @param tableName   表名称
     * @param serviceName 服务名称
     * @param menuName
     * @param zip
     * @throws PospBusinessException
     */
    void generatorAllFile(String tableName, String serviceName, String menuName, ZipOutputStream zip)
            throws PospBusinessException {
        // 表结构信息
        DbTableDO table = getTable(tableName);
        if (null == table) {
            return;
        }
        Map<String, Object> model = new HashMap<>();
        // 小驼峰名称
        table.setSmallCamelName(CamelNameUtil.underline2Camel(table.getTableName().substring(2), true));
        // 大驼峰名称
        table.setBigCamelName(CamelNameUtil.underline2Camel(table.getTableName().substring(2), false));
        // 表列信息
        List<DbTableColumnDO> columnList = getTableColumn(tableName);
        DbTableColumnDO pkColumn = new DbTableColumnDO();
        // 转换字段->属性，以及jdbcType
        for (DbTableColumnDO column : columnList) {        	
            column.setPropertyName(CamelNameUtil.underline2Camel(column.getColumnName(), true));
            column.setJdbcType(parseJdbcType(column));
            column.setJavaType(parsejavaType(column));
            // 单独设置pk主键
            if ("id".equals(column.getColumnName().toLowerCase())) {
                pkColumn = column;
            }
        }
        model.put("dateTime", DateTimeUtil.getCurrentDatetime(DateTimeUtil.TimeFormat.DATE_TIME_PATTERN_SLASH));
        model.put("table", table);
        model.put("columnList", columnList);
        model.put("pkColumn", pkColumn);
        model.put("serviceName", serviceName);
        model.put("packageName", "com.posp.service." + serviceName);
        model.put("commonPackageName", "com.posp.common.service." + serviceName);
        model.put("menuName", menuName);
        model.put("author", ShiroUtil.getUserName());

        // 生成页面文件，包含主页面list,新增add，修改edit，详情detail
        genUi(model, "ui/list.ftl", "list.html", zip);
        genUi(model, "ui/add.ftl", "add.html", zip);
        genUi(model, "ui/edit.ftl", "edit.html", zip);
        genUi(model, "ui/detail.ftl", "detail.html", zip);
        genUi(model, "ui/js.ftl", table.getSmallCamelName() + ".js", zip);
        genUi(model, "ui/controller.ftl", table.getBigCamelName() + "Controller.java", zip);
        genUi(model, "ui/feign.ftl", "I" + table.getBigCamelName() + "ServiceFeign.java", zip);
        genUi(model, "ui/hystrix.ftl", table.getBigCamelName() + "ServiceFeignHystrixImpl.java", zip);
        // 生成后台服务相关的文件
        genService(model, "service/xml.ftl", table.getBigCamelName() + "Mapper.xml", zip);
        genService(model, "service/controller.ftl", table.getBigCamelName() + "Controller.java", zip);
        genService(model, "service/service.ftl", "I" + table.getBigCamelName() + "Service.java", zip);
        genService(model, "service/serviceImpl.ftl", table.getBigCamelName() + "ServiceImpl.java", zip);
        genService(model, "service/mapper.ftl", "I" + table.getBigCamelName() + "Mapper.java", zip);
        genService(model, "service/insert.ftl", table.getBigCamelName() + "AO.java", zip);
        genService(model, "service/update.ftl", table.getBigCamelName() + "BO.java", zip);
        genService(model, "service/entity.ftl", table.getBigCamelName() + "DO.java", zip);
        genService(model, "service/query.ftl", table.getBigCamelName() + "Query.java", zip);
        genSql(model, "sql.ftl", table.getSmallCamelName() + ".sql", zip);
    }

    @Override
    public byte[] generatorCode(String[] tableNames, String serviceName, String menuName) throws PospBusinessException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        for (String tableName : tableNames) {
            generatorAllFile(tableName, serviceName, menuName, zip);
        }
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

    /**
     * 将oracle数据类型转换为jdbc类型
     *
     * @param column
     * @return jdbc类型
     * @version v1.0.1, 2018/09/04 11:54:39 下午
     * @author gaofeng
     */
    String parseJdbcType(DbTableColumnDO column) {
    	log.info("columnName:{},dateType:{},dateScale:{}",column.getColumnName(),column.getDataType(),column.getDataScale());
        String jdbcType = null;
        if ("VARCHAR2".equals(column.getDataType())) {
            jdbcType = new String("VARCHAR");
        } else if ("DATE".equals(column.getDataType())) {
            jdbcType = new String("TIMESTAMP");
        } else if ("NUMBER".equals(column.getDataType()) && (0 == column.getDataScale())) {
            jdbcType = new String("BIGINT");
        } else if ("NUMBER".equals(column.getDataType())) {
            jdbcType = new String("DECIMAL");
        } else if ("INTEGER".equals(column.getDataType())) {
            jdbcType = new String("INTEGER");
        } else {
            jdbcType = new String("VARCHAR");
        }
        return jdbcType;
    }

    /**
     * 将oracle数据类型转换为java的类型
     *
     * @param column
     * @return
     * @version v1.0.1, 2018/09/05 12:03:19 上午
     * @author gaofeng
     */
    String parsejavaType(DbTableColumnDO column) {
        String javaType = null;
        if ("VARCHAR2".equals(column.getDataType())) {
            javaType = new String("String");
        } else if ("DATE".equals(column.getDataType())) {
            javaType = new String("Date");
        } else if ("INTEGER".equals(column.getDataType())) {
            javaType = new String("Long");
        } else if ("NUMBER".equals(column.getDataType()) && (0 == column.getDataScale())) {
            javaType = new String("Long");
        } else if ("NUMBER".equals(column.getDataType())) {
            javaType = new String("BigDecimal");
        } else {
            javaType = new String("String");
        }
        return javaType;
    }

    /**
     * 获取表结构信息
     *
     * @param tableName 表名
     * @return DbTableDO 表结构实体类
     */
    DbTableDO getTable(String tableName) {
        DbTableDO tableDO = tableService.getByTableName(tableName);
        if ((null == tableDO)) {
            return null;
        }
        return tableDO;
    }

    /**
     * 获取表的列结构信息
     *
     * @param tableName 表名
     * @return List<DbTableColumnDO> 列结构类列表
     */
    List<DbTableColumnDO> getTableColumn(String tableName) {
        List<DbTableColumnDO> list = tableColumnService.selectByName(tableName);
        if ((null == list) || list.isEmpty()) {
            return null;
        }
        return list;
    }
}
