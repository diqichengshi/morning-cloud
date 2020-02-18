import com.morning.common.util.JsonUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lst on 2019/9/27.
 * 描述:
 */
public class TestJson {
    public static void main(String[] args) {
        List<String> list=new ArrayList<>();
        list.add("满69-20元");
        list.add("关注产品★送钢化膜");
        list.add("BIT配次日达");
        String json= JsonUtil.toJsonStr(list);
        String aa="[{title: '商品名称',content: 'iPhone7手机壳'},{title: '商品编号',content: '10435663237'},{title: '店铺',content: 'GavinShop'},{title: '商品毛重',content: '100.00g'},{title: '商品产地',content: '中国大陆'},{title: '机型',content: 'iPhone7'},{title: '材质',content: 'PC/塑料'},{title: '款式',content: '软壳'},{title: '适用人群',content: '通用'}]";
        List<String> newList=JsonUtil.toList(aa);
        System.out.println(json);
        System.out.println(newList.toString());
    }
}
