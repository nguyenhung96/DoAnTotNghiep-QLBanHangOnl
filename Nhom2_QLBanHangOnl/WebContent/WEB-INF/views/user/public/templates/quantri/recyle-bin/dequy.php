<?php
function dequymenu($arr,$parent){
    global $lang;
    echo '<ul class="list-group">';
    foreach ($arr as $k=> $v) :
        if ($v['parent'] == $parent) :
            unset($arr[$k]);
            echo '<li class="list-group-item">';
            echo '<span class="icon glyphicon"></span>';
            echo '<span class="icon node-icon fa fa-folder text-primary-light"></span>';
            echo '<a class="click-edit-menu" data-id="'. $v['id'] .'" data-parent-id="' . $v['parent'] . '" href="#">' . $v['name'] . '</a>';
                echo '<div>
                        <table class="table table-hover btl-list-bbli bg-white">

                            <tr>
                                <td>Thứ tự</td>
                                <td>
                                    <input type="text" name="sort" id="menu_sort_' . $v['id'] . '" class="form-control" value="' . $v['sort'] . '"/>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Nổi bật</th>
                                                <th>Ẩn/Hiện</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-left"><span class="star '. ($v['parent']==$lang?'tool':'') .' '. ($v['hot']==1?'active':'') .'" data-action="toggleStatus" data-field="hot" data-table="tbl_item_category" title="Nổi bật" value="'.$v['id'].'"></span></td>
                                                <td class="text-left"><span class="check '. ($v['parent']==$lang?'tool':'') .' '. ($v['status']==1?'active':'') .'" data-action="toggleStatus" data-field="status" data-table="tbl_item_category" title="Ẩn hiện" value="'.$v['id'].'"></span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>   
                            <tr>
                                <td class="col-sm-3">&nbsp;</td>
                                <td class="col-sm-9">
                                    <input type="button" data-id="' . $v['id'] . '" class="btn btn-danger" value="Lưu" onclick="edit_category('.$v['id'].');" />
                                    <input type="button" data-id="' . $v['id'] . '" class="btn btn-primary" value="Xóa" onclick="remove_category('.$v['id'].', '.$v['parent'].');" />
                                </td>
                            </tr>
                        </table>
                    </div>';
                    if ($arr) {
                        dequymenu($arr,$v['id']);
                    }
            echo '</li>';
        endif;
    endforeach;
    echo '</ul>';
}

function buildTree(array $elements, $parentId = 0) {//Sắp xếp cấp độ mảng
    $branch = array();
    foreach ($elements as $element) {
        if ($element['parent'] == $parentId) {
            $children = buildTree($elements, $element['id']);
            if ($children) {
                $element['list_category'] = $children;
            }
            $branch[] = $element;
        }
    }
  return $branch;
}
?>