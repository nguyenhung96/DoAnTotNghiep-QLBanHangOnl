<script type="text/javascript">
$(document).ready(function() {

	$("#chkall").click(function(){
		var status=this.checked;
		$("input[class='tai_c']").each(function(){this.checked=status;})
	});

});
</script>
<style type="text/css">
#menu_wrapper ul {
  margin-bottom: 0;
  margin-top: 10px;
}
#menu_wrapper ul:first-child {
  margin-top: 0;
}
#menu_wrapper ul li {
	border: none;
}
#menu_wrapper ul ul {
  display: none;
  margin-left: 10px;
}
</style>
<link rel="stylesheet" type="text/css" href="assets/plugins/oneui-fw/css/bootstrap-treeview.min.css" />
<div class="content" style="min-height: 530px;">
	<h3>Danh mục Sản phẩm</h3>
	<div class="table-responsive bg-white">
		<div class="block-header">
			<form class="form-inline" method="POST" action="" name="frmForm" enctype="multipart/form-data">
				<div class="col-sm-2">
					<button type="button" class="btn btn-success push-5-r push-10" onclick="linkto('item_category_m');">
						<i class="fa fa-plus"></i>
						Thêm mới danh mục sản phẩm
					</button>
				</div><!-- End .fils1 -->
			</form>
		</div>
		<div class="block-content block-content-full">
			<div id="menu_wrapper" class="js-tree-collapsed treeview">
				<?php
  					function show_menu_select ($arr, $parent) {
			    		foreach ($arr as $k=> $v) :
			        		if ($v['parent'] == $parent) :
			            	unset($arr[$k]);

			            	echo '<li class="list-group-item">';
			            		if ($arr) echo '<span class="icon expand-icon fa fa-plus" data-id="'. $v['id'] .'" data-parent-id="' . $v['parent'] . '"></span>';
			            		else echo '<span class="icon glyphicon"></span>';
									echo '<span class="icon node-icon fa fa-folder text-primary-light"></span>';
									echo '<a class="click-edit-menu" data-id="'. $v['id'] .'" data-parent-id="' . $v['parent'] . '" href="#">' . $v['name'] . '</a>';
			            	echo '</li>';
			        		endif;
				    	endforeach;
					}       

             	$result_menu = get_records('tbl_item_category','status = 1','sort asc',' ',$lang);
					$data_menu   = array();
					while ($row = mysql_fetch_assoc($result_menu)) {
                 	$data_menu[] = $row;
             	}
            ?>
				
				<script language="javascript">
				  	var menus = new Array();
				  	<?php foreach ($data_menu as $item) { ?>
				      menus.push({
							menu_id             : '<?php echo $item['id']; ?>',
							menu_name           : '<?php echo $item['name']; ?>',
							menu_parent_id      : '<?php echo $item['parent']; ?>',
				      });
				  <?php } ?>
				</script>

				<ul class="list-group">
					<?php show_menu_select($data_menu, $lang); ?>
				</ul>

				<script language="javascript">

				  	var html = '';

				  	function get_parent (menu, parent_id) {

				      // Bước 1
				      var loop = new Array();
				      var contin = new Array();

				      for (var i = 0; i < menu.length; i++) {
					                            
                   	if (menu[i].menu_parent_id == parent_id) {
                       	loop.push(menu[i]);
                   	} else {
                       contin.push(menu[i]);
                   	}

                  }

				      // Bước 2
				      for (var i = 0; i< loop.length; i++) {

				      	var c=0;
				      	var has_sub = '';

				      	for (var j = 0; j < menu.length; j++)
								if (menu[j].menu_parent_id == loop[i].menu_id) 
									c++;

	                  if (c>0) has_sub = 'expand fa fa-plus';
	                  else has_sub = 'glyphicon';

							html += '<li class="list-group-item"><span class="icon '+ has_sub +'"></span><span class="icon node-icon fa fa-folder text-primary-light"></span><a>'+ loop[i].menu_name +'</a></li>';
							get_parent(contin, loop[i].menu_id);
				      }
				  	}

				  	$(function() {

				  		$('#menu_wrapper').on('click', '.expand-icon', function(event) {
							if ($(this).hasClass('fa fa-plus')) {
								$(this).removeClass('fa fa-plus');
								$(this).addClass('fa fa-minus');
							} else {
								$(this).removeClass('fa fa-minus');
								$(this).addClass('fa fa-plus');
							}
						});

				      get_parent(menus, <?php echo $lang; ?>);
				      $('#menu_wrapper > ul').html(html);

				  	});

				</script>

			</div>

		</div>
	</div>
</div>