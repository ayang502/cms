<?php
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header','admin');
?>
<div class="pad-10">
<form name="searchform" action="" method="get" >
<input type="hidden" value="content" name="m">
<input type="hidden" value="content" name="c">
<input type="hidden" value="public_relation" name="a">
<input type="hidden" value="<?php echo $modelid;?>" name="modelid">
<table width="100%" cellspacing="0" class="search-form">
    <tbody>
		<tr>
		<td align="center">
		<div class="explain-col">
                <select name="siteid" onchange="return load_file_list(this.value);">
                <?php foreach ($site_list as $v) {
                    $tmp_siteid = $v['siteid'];
                ?>
                    <option value='<?php echo $v['siteid'];?>' <?php if($_GET['siteid']==$tmp_siteid) echo 'selected';?>><?php echo $v['name'];?></option>
                <?php }?>
				</select>
                <span id="select_category" name="catid">
                    <?php echo form::select_category('', $_GET['catid'], 'name="catid"', L('please_select_category'),  0, -1, 0, $siteid, 0);?>
                </span>

                    <p></p>
                <select name="field">
					<option value='title' <?php if($_GET['field']=='title') echo 'selected';?>><?php echo L('title');?></option>
					<option value='keywords' <?php if($_GET['field']=='keywords') echo 'selected';?> ><?php echo L('keywords');?></option>
					<option value='description' <?php if($_GET['field']=='description') echo 'selected';?>><?php echo L('description');?></option>
					<option value='id' <?php if($_GET['field']=='id') echo 'selected';?>>ID</option>
				</select>
				<input name="keywords" type="text" value="<?php echo stripslashes($_GET['keywords'])?>" style="width:330px;" class="input-text" />
				<input type="submit" name="dosubmit" class="button" value="<?php echo L('search');?>" />
	</div>
		</td>
		</tr>
    </tbody>
</table>
</form>
<div class="table-list">
    <table width="100%" cellspacing="0" >
        <thead>
            <tr>
            <th ><?php echo L('id');?></th>
            <th ><?php echo L('title');?></th>
            <th ><?php echo L('username');?></th>
			<th width="100"><?php echo L('belong_category');?></th>
            <th width="100"><?php echo L('addtime');?></th>
            </tr>
        </thead>
    <tbody>
    <?php foreach($infos as $r) { 
        if ($_GET['type'] == 'id') {
            $sitid = empty($_GET['siteid']) ? $this->siteid : $_GET['siteid'];
            $value = $r['id'];
            $value = $modelid . ',' . $value;
        } else if ($_GET['type'] == 'name') {
            $value = $r['title'];
        }
    ?>
	<tr onclick="select_list(this,'<?php echo $value?>');" class="cu" title="<?php echo L('click_to_select');?>">
		<td align='left'><?php echo $r['id'];?></td>
		<td align='left'><?php echo $r['title'];?></td>
		<td align='left'><?php echo $r['username'];?></td>
		<td align='center'><?php echo $this->categorys[$r['catid']]['catname'];?></td>
		<td align='center'><?php echo format::date($r['inputtime']);?></td>
	</tr>
	 <?php }?>
	    </tbody>
    </table>
   <div id="pages"><?php echo $pages;?></div>
</div>
</div>
<style type="text/css">
 .line_ff9966,.line_ff9966:hover td{
	background-color:#FF9966;
}
 .line_fbffe4,.line_fbffe4:hover td {
	background-color:#fbffe4;
}
</style>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function load_file_list(id) {
        if(id=='') return false;
        $.getJSON('?m=content&c=content&a=public_relation_cate_list&siteid='+id, function(data){$('#select_category').html(data.page_template);});
    }

    var relation_var = '<?php echo $_GET['relation_var']?>';
    function select_list(obj, value) {
		var relation_ids = window.top.$('#'+relation_var).val();
		if($(obj).attr('class')=='line_ff9966' || $(obj).attr('class')==null) {
			$(obj).attr('class','line_fbffe4');
			if(relation_ids !='' ) {
				var r_arr = relation_ids.split('|');
				var newrelation_ids = '';
				$.each(r_arr, function(i, n){
					if(n != value) {
						if(i==0) {
							newrelation_ids = n;
						} else {
						    newrelation_ids = newrelation_ids+'|'+n;
						}
					}
				});
				window.top.$('#'+relation_var).val(newrelation_ids);
			}
		} else {
			$(obj).attr('class','line_ff9966');
			if(relation_ids =='' ) {
				window.top.$('#'+relation_var).val(value);
			} else {
				relation_ids = relation_ids+'|'+value;
				window.top.$('#'+relation_var).val(relation_ids);
			}
		}
}
//-->
</SCRIPT>
</body>
</html>
