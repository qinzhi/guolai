<?php
namespace Admin\Controller;
use \Common\Library\Org\Util\Tree;
class GoodsCategoryController extends AdminController {

    public function __construct(){
        parent::__construct();
        $this->category = D('GoodsCategory');
    }

    public function index(){
        $categories = $this->category->getCategories();
        $tree = new Tree($categories);
        $goodsCategories = $tree->leaf();
        $this->assign('goodsCategories',$goodsCategories);
        $this->assign('tree',$this->category->format_tree($categories));
        $this->display('Goods/category');
    }

    public function getCategory(){
        $id = I('request.id/d');
        $category = $this->category->getCategoryById($id);
        if(IS_AJAX){
            $this->ajaxReturn($category);
        }else{
            return $category;
        }
    }

    public function getCategoriesTree(){
        $categories = $this->category->getCategories();
        $tree = new Tree($categories);
        $categories = $tree->leaf();
        $tree = $this->category->format_tree($categories,true,false);
        if(IS_AJAX){
            echo $tree;
        }else{
            return $tree;
        }
    }

    public function add(){
        if(IS_POST){
            $pid = I('request.p_id/d',0);
            $pcategory = $this->category->getCategoryByPid($pid);
            if($pid == 0) $level = 0;
            else{
                $category = $this->category->getCategoryById($pid);
            }
            $sort = !empty($pcategory) ? ($pcategory['sort'] + 1) : 0;
            $data = array(
                'pid' => $pid,
                'name' => trim(I('request.name')),
                'sort' => $sort,
            );
            $seo = array(
                'title' => trim(I('request.title')),
                'keywords' => trim(I('request.keywords')),
                'descript' => trim(I('request.descript')),
            );
            $result = $this->category->addCategory($data,$seo);
            if($result === false){
                $this->error('分类添加失败',U('GoodsCategory/index'));
                return;
            }
        }
        $this->redirect(U('/GoodsCategory/index'));
    }

    public function edit(){
        if(IS_AJAX){
            parse_str(urldecode(I('request.params')),$params);
            $pid = $params['p_id'];
            $category = $this->category->getCategoryById($pid);
            if($pid == 0) $level = 0;
            else $level = $category['level'] + 1;
            $id = $params['id'];
            $data = array(
                'pid' => $params['p_id'],
                'level' => $level,
                'name' => trim($params['name']),
            );
            $seo = array(
                'title' => trim($params['title']),
                'keywords' => trim($params['keywords']),
                'descript' => trim($params['descript']),
            );
            $result = $this->category->updateCategoryById($data,$seo,$id);
            if($result){
                $result = array('code'=>1,'msg'=>'保存成功');
            }else{
                $result = array('code'=>0,'msg'=>'保存失败');
            }
        }else{
            $result = array('code'=>0,'msg'=>'异常提交');
        }

        $this->ajaxReturn($result);
    }

    public function del(){
        if(IS_AJAX){
            $id = I('request.id/d');
            $category = $this->category->getCategoryByPid($id);
            if(!empty($category)){
                $result = array('code'=>0,'msg'=>'不能直接删除上级模块');
            }else{
                if($this->category->delCategoryById($id)){
                    $result = array('code'=>1,'msg'=>'删除成功');
                }else{
                    $result = array('code'=>0,'msg'=>'删除失败');
                }
            }
        }else{
            $result = array('code'=>0,'msg'=>'异常提交');
        }
        $this->ajaxReturn($result);
    }

    public function move(){
        if(IS_AJAX){
            $id = I('request.id/d');
            $action = I('request.action');
            $result = $this->category->move($id,$action);
            if($result){
                $result = array('code'=>1,'msg'=>'移动成功');
            }else{
                $result = array('code'=>0,'msg'=>'移动失败');
            }

        }else{
            $result = array('code'=>0,'msg'=>'异常提交');
        }
        $this->ajaxReturn($result);
    }

}