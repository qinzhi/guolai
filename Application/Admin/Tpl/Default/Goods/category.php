<extend name="Layout/base" />
<block name="css">
    <link href="__CSS__/metroStyle/metroStyle.css" rel="stylesheet" >
</block>
<block name="content">
    <div class="row no-margin">
        <div class="col-lg-12 col-sm-12 col-xs-12 no-padding">
            <div class="widget flat no-margin">
                <div class="widget-header widget-fruiter">
                    <a class="btn btn-success" id="add" href="javascript:void(0);">添加</a>
                    <a id="save" class="btn btn-success" href="javascript:void(0);">保存</a>
                    <span class="division"> | </span>
                    <a id="delete" class="btn btn-danger" href="javascript:void(0);">删除</a>
                </div><!--Widget Header-->
                <div class="widget-body plugins_category-">
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <div class="well">
                                <table class="table table-bordered table-condensed table-middle flip-content dataTable">
                                    <thead class="flip-content bordered-palegreen">
                                    <tr>
                                        <th width="70%">分类名称</th>
                                        <th width="30%">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php $show_category = function($category,$level,$path) use (&$show_category){
                                        if(!empty($category) && is_array($category)):
                                            $class = '';
                                            if($level){
                                                $class = '<span class="margin-left-' . 20 * $level . '"></span>';
                                            }
                                            if($level < 2){
                                                $icon = '<i class="fa row-details fa-minus-square-o ifold"></i>';
                                            }
                                            foreach($category as $value):
                                                $tmp_path = $path . $value['id'] . '_';
                                                $html = '<tr data-id="' . $value['id'] . '" data-path="' . $tmp_path . '" data-pid="' . $value['pid'] . '">';
                                                if(empty($value['child'])){
                                                    $icon = '<i class="fa row-details"></i>';
                                                }
                                                $html .= '<td>' . $class . $icon . '&nbsp;<span class="category_name">' .$value['name'] . '</span></td>
                                                        <td>
                                                            <a class="btn btn-default btn-xs shiny icon-only success btn-move" href="javascript:void(0);" data-action="up"><i class="fa fa-arrow-up"></i></a>
                                                            <a class="btn btn-default btn-xs shiny icon-only success btn-move" href="javascript:void(0);" data-action="down"><i class="fa fa-arrow-down"></i></a>
                                                            <a class="btn btn-success btn-xs shiny icon-only white btn-get" href="javascript:void(0);"><i class="fa fa-edit"></i></a>
                                                        </td>
                                                    </tr>';
                                                echo $html;
                                                if(!empty($value['child'])):
                                                    $show_category($value['child'],++$level,$tmp_path);
                                                endif;
                                            endforeach;
                                        endif;
                                    };$show_category($goodsCategories,0,'path_');?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="well">
                                <form action="{:U('GoodsCategory/edit')}" id="form-edit" class="form-horizontal bv-form form-category" data-action="edit" onsubmit="return false;" autocomplete="off">
                                    <div class="form-group has-feedback">
                                        <label class="col-lg-4 control-label">分类名称
                                            <span class="red">*</span>：
                                        </label>
                                        <div class="col-lg-8">
                                            <input name="name" class="form-control" type="text">
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label class="col-lg-4 control-label">分类颜色
                                            <span class="red">*</span>：
                                        </label>
                                        <div class="col-lg-8">
                                            <input class="form-control" type="text" id="colorValue" name="colorValue"/>
                                            <input name="color" id="color" type="hidden">
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label class="col-lg-4 control-label">SEO标题：</label>
                                        <div class="col-lg-8">
                                            <input name="title" class="form-control" type="text">
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label class="col-lg-4 control-label">SEO关键词：</label>
                                        <div class="col-lg-8">
                                            <input name="keywords" class="form-control" type="text">
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label class="col-lg-4 control-label">SEO描述：</label>
                                        <div class="col-lg-8">
                                            <span class="input-icon icon-right">
                                                <textarea name="descript" class="form-control"></textarea>
                                                <i class="fa  fa-rocket darkorange"></i>
                                            </span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div><!--Widget Body-->
            </div><!--Widget-->
        </div>
    </div>
    <div id="addModal" style="display:none;">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal bv-form form-category" method="post" data-action="add" action="{:U('GoodsCategory/add')}" autocomplete="off"></form>
            </div>
        </div>
    </div>
    <div id="color_panel" class="tree_panel">
        <ul class="color-box">
            <li class="color-list" style="background-color: #ff655b;" data-color="red" data-value="红色">红色</li>
            <li class="color-list" style="background-color: #f2d659;" data-color="yellow" data-value="黄色">黄色</li>
            <li class="color-list" style="background-color: #4ece72;" data-color="green" data-value="绿色">绿色</li>
        </ul>
        <ul class="color-box">
            <li class="color-list" style="background-color: #b36edb;" data-color="purple" data-value="紫色">紫色</li>
            <li class="color-list" style="background-color: #47c2f1;" data-color="blue" data-value="蓝色">蓝色</li>
            <li class="color-list" style="background-color: #ffffff;" data-color="white" data-value="白色">白色</li>
        </ul>
    </div>
</block>
<block name="js">
<script>
    $(function(){
        $('#add').click(function(){
            bootbox.dialog({
                message: function(){
                    var form = $('#addModal .col-md-12 .form-category');
                    if(form.html() == ''){
                        form.append($('form.form-category').html());
                    }
                    else{form[0].reset();}
                    form.find('.position-root').hide();
                    return $("#addModal").html();
                },
                title: "添加分类",
                className: "modal-sky",
                buttons: {
                    "cancel": {
                        label: "取消",
                        className: "btn-default",
                        callback: function () { }
                    },
                    "confirm": {
                        label: "确定",
                        className: "btn-success",
                        callback: function () {
                            $('.modal-dialog form.form-category').submit();
                        }
                    }
                }
            });
        });

        var panel = $('#color_panel');
        $('.color-box li').click(function(){
            var color = $(this).data('color');
            var value = $(this).data('value');
            $('#colorValue').val(value);
            $('#color').val(color);
            panel.hide();
        });
        $('#colorValue').on({
            focus: function(){
                panel.css({
                    left:$(this).offset().left + "px",
                    top:$(this).offset().top + $(this).outerHeight() - $('.navbar-inner').height() + "px",
                    width: $(this).outerWidth() + "px"
                }).slideDown("fast");
            }
        });
        $('#save').click(function(){
            if(category_id > 0){
                var query = $('.plugins_category- form').serialize();
                query += '&id=' + category_id;
                $.fruiter.post('{:U("GoodsCategory/edit")}',{params:encodeURIComponent(query)},function(data){
                    if(data.code == 1){
                        $('.plugins_category- .dataTable').find('tr[data-id='+category_id+']')
                            .find('.category_name').text($('.plugins_category- form').find('input[name=name]').val());
                        Notify(data.msg, 'bottom-right', '5000', 'success', 'fa-check', true);
                    }else{
                        Notify(data.msg, 'bottom-right', '5000', 'danger', 'fa-bolt', true);
                    }
                });
            }else{
                Notify('请先选择分类', 'bottom-right', '5000', 'warning', 'fa-warning', true);
            }
        });
        $('#delete').click(function(){
            if(category_id > 0){
                var category_name = $('.plugins_category- .dataTable').find('tr[data-id='+category_id+']').find('.category_name').text();
                bootbox.confirm("确定要删除<span class='red'>"+category_name+"</span>分类?", function (result) {
                    if (result) {
                        $.fruiter.post('{:U("GoodsCategory/del")}',{id:category_id},function(data){
                            if(data.code == 1){
                                $('.plugins_category- table').find('tr[data-id='+category_id+']').remove();
                                category_id = null;
                                document.getElementById('form-edit').reset();
                                Notify(data.msg, 'bottom-right', '5000', 'success', 'fa-check', true);
                            }else{
                                Notify(data.msg, 'bottom-right', '5000', 'danger', 'fa-bolt', true);
                            }
                        });
                    }
                });
            }else{
                Notify('请先选择分类', 'bottom-right', '5000', 'warning', 'fa-warning', true);
            }
        });
    });
</script>
<script src="__JS__/jquery.ztree.all-3.5.min.js"></script>
<script>
$(function(){
    $('.plugins_category- table').find('.btn-get').click(function(){
        var tr = $(this).parents('tr');
        if(!$(tr).hasClass('tr-focus')){
            $(tr).parent().find('.tr-focus').removeClass('tr-focus');
            $(tr).addClass('tr-focus');
        }
        var form = document.getElementById('form-edit');
        $.fruiter.post("{:U('GoodsCategory/getCategory')}",{id:$(tr).data('id')},function(data){
            if(data){
                category_id = data.id;
                form.name.value = data.name;
                form.p_id.value = data.pid;
                form.title.value = data.title;
                form.keywords.value = data.keywords;
                form.descript.value = data.descript;
                var nodes = zTree.getNodes();
                for(var i in nodes){
                    if(data.pid == 0 || nodes[i].id == data.pid){
                        nodes[i].checked = 'checked';
                        zTree.updateNode(nodes[i],false);
                        form.p_name.value = nodes[i].name;
                        break;
                    }
                }
            }
        });
    });

    $('.plugins_category- table').find('.btn-move').click(function(){
        var action = $(this).data('action');
        var tr = $(this).parents('tr');
        if(!$(tr).hasClass('tr-focus')){
            $(tr).parent().find('.tr-focus').removeClass('tr-focus');
            $(tr).addClass('tr-focus');
        }
        var pid = $(tr).data('pid');
        var trs = $(tr).parents('tbody').find('tr[data-pid='+pid+']');
        if(tr.data('id') == $(trs[0]).data('id') && action == 'up' ){
            Notify('无法上移', 'bottom-right', '5000', 'warning', 'fa-warning', true);
        }else if(tr.data('id') == $(trs[trs.length-1]).data('id') && action == 'down' ){
            Notify('无法下移', 'bottom-right', '5000', 'warning', 'fa-warning', true);
        }else{
            $.fruiter.post("{:U('GoodsCategory/move')}",{id:$(tr).data('id'),action:action},function(data){
                if(data.code == 1){
                    for(var i in trs){
                        if($(trs[i]).data('id') == tr.data('id')){
                            if(action == 'up'){
                                $('tr[data-path^=' + tr.data('path') + ']').insertBefore($(trs[parseInt(i)-1]));
                            }else if(action == 'down'){
                                $('tr[data-path^=' + tr.data('path') + ']').insertAfter($(trs[parseInt(i)+1]));
                            }
                            break;
                        }
                    }
                    Notify(data.msg, 'bottom-right', '5000', 'success', 'fa-check', true);
                }else{
                    Notify(data.msg, 'bottom-right', '5000', 'danger', 'fa-bolt', true);
                }
            });
        }
    });

    $('.ifold').click(function(){
        var tr = $(this).parents('tr');
        var path = tr.data('path');
        if($(this).hasClass('fa-minus-square-o')){
            $('.plugins_category- .dataTable').find('tr[data-path^='+path+']').each(function(index){
                if(index) $(this).hide();
            });
            $(this).removeClass('fa-minus-square-o').addClass('fa-plus-square-o');
        }else if($(this).hasClass('fa-plus-square-o')){
            $('.plugins_category- .dataTable').find('tr[data-path^='+path+']').each(function(index){
                if(index) $(this).show();
            });
            $(this).removeClass('fa-plus-square-o').addClass('fa-minus-square-o');
        }
    });
});
</script>
</block>