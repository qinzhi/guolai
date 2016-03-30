<table class="table-form">
    <colgroup>
        <col width="150px"><col>
    </colgroup>
    <tbody>
        <tr>
            <th>商品名称：</th>
            <td>
                <div class="form-group has-feedback no-margin">
                    <input id="name" name="name" class="input-sm Lwidth400" type="text" pattern="required" maxlength="50">
                    <span class="note control-label margin-left-10">*</span>
                </div>
            </td>
        </tr>
        <tr>
            <th>关键字：</th>
            <td>
                <div class="form-group has-feedback no-margin">
                    <input id="search_words" name="search_words"  type="text" class="input-sm Lwidth300" maxlength="50"/>
                    <span class="note control-label margin-left-10">每个关键词最长为15个字符，必须以","(逗号)分隔符</span>
                </div>
            </td>
        </tr>
        <tr>
            <th>所属分类：</th>
            <td>
                <div class="form-group has-feedback no-margin">
                    <input id="category" class="input-sm Lwidth400" type="text">
                    <input id="category_id" name="category_id" class="hidden" type="text">
                </div>
            </td>
        </tr>
        <tr>
            <th>是否上架：</th>
            <td>
                <span class="control-group">
                    <div class="radio line-radio">
                        <label class="no-padding">
                            <input name="status" type="radio" checked="checked" value="0">
                            <span class="text">下架</span>
                        </label>
                    </div>
                    <div class="radio line-radio">
                        <label>
                            <input name="status" type="radio" value="1">
                            <span class="text">上架</span>
                        </label>
                    </div>
                </span>
            </td>
        </tr>
        <tr>
            <th>基本数据：</th>
            <td>
                <table class="table table-bordered table-hover table-border">
                    <thead>
                        <tr>
                            <th class="base">商品货号</th>
                            <th class="base">库存</th>
                            <th class="base">重量(千克)</th>
                            <!--<th class="base">购买成功增加积分</th>-->
                            <th class="base">排序</th>
                            <th class="base">计量单位显示</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="base">
                            <td class="base">
                                <div class="form-group has-feedback no-margin">
                                    <input class="input-xs Lwidth150" type="text" name="_goods_no[]" pattern="required" maxlength="20">
                                </div>
                            </td>
                            <td class="base">
                                <div class="form-group has-feedback no-margin">
                                    <input class="input-xs Lwidth80" type="text" name="_store_nums[]" pattern="int" maxlength="10">
                                </div>
                            </td>
                            <td class="base">
                                <div class="form-group has-feedback no-margin">
                                    <input class="input-xs Lwidth80" type="text" name="_weight[]" pattern="float" maxlength="10">
                                </div>
                            </td>
                            <!--<td class="base">
                                <div class="form-group has-feedback no-margin">
                                    <input class="input-xs Lwidth80" type="text" name="_point[]" pattern="float" maxlength="10">
                                </div>
                            </td>-->
                            <td class="base">
                                <div class="form-group has-feedback no-margin">
                                    <input class="input-xs Lwidth80" type="text" name="_sort[]" pattern="float" maxlength="10">
                                </div>
                            </td>
                            <td class="base">
                                <div class="form-group has-feedback no-margin">
                                    <input class="input-xs Lwidth80" type="text" name="_unit[]" pattern="float" maxlength="10">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <th>批发价格：</th>
            <td>
                <table class="table table-bordered table-hover table-border">
                    <thead>
                        <tr>
                            <th class="base">购买件数</th>
                            <th class="base">平台价格</th>
                            <th class="base">成本价格</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="base">
                            <td class="base">
                                <div class="form-group has-feedback no-margin">
                                    <span>≥</span>
                                    <input class="input-xs Lwidth80" type="text" name="_goods_no[]" pattern="required" maxlength="20">
                                </div>
                            </td>
                            <td class="base">
                                <div class="form-group has-feedback no-margin">
                                    <input class="input-xs Lwidth80" type="text" name="_market_price[]" pattern="float" maxlength="10">
                                </div>
                            </td>
                            <td class="base">
                                <div class="form-group has-feedback no-margin">
                                    <input class="input-xs Lwidth80" type="text" name="_cost_price[]" pattern="float" maxlength="10">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <th>批发规则：</th>
            <td>
                <a class="btn btn-success btn-sm pull-left no-radius" href="javascript:void(0);" id="addSpec" data-status="true">
                    <i class="fa fa-plus"></i>
                    添加规则
                </a>
            </td>
        </tr>
        <tr>
            <th>商品类型：</th>
            <td>
                <div class="checkbox checkbox-inline no-margin no-padding">
                    <label class="no-padding">
                        <input type="checkbox" name="commend_type[]" value="1">
                        <span class="text">最新商品</span>
                    </label>
                </div>
                <div class="checkbox checkbox-inline no-margin">
                    <label>
                        <input type="checkbox" name="commend_type[]" value="2">
                        <span class="text">特价商品</span>
                    </label>
                </div>
                <div class="checkbox checkbox-inline no-margin">
                    <label>
                        <input type="checkbox" name="commend_type[]" value="3">
                        <span class="text">热卖商品</span>
                    </label>
                </div>
                <div class="checkbox checkbox-inline no-margin">
                    <label>
                        <input type="checkbox" name="commend_type[]" value="4">
                        <span class="text">推荐商品</span>
                    </label>
                </div>
            </td>
        </tr>
    </tbody>
</table>
<script>
    $(function(){

    });
</script>