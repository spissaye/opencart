<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="icon-exclamation-sign"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="icon-ok-sign"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right"><a href="<?php echo $insert; ?>" class="btn btn-primary"><i class="icon-plus"></i> <?php echo $button_insert; ?></a>
        <div class="btn-group">
          <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="icon-trash"></i> <?php echo $button_delete; ?> <i class="icon-caret-down"></i></button>
          <ul class="dropdown-menu pull-right">
            <li><a onclick="$('#form-location').submit();"><?php echo $text_confirm; ?></a></li>
          </ul>
        </div>
      </div>
      <h1 class="panel-title"><i class="icon-list"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-location">
        <div class="table-responsive">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td width="1" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                <td class="text-left"><?php if ($sort == 'l.name') { ?>
                  <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                  <?php } ?></td>
                <td class="text-left"><?php if ($sort == 'l.address_1') { ?>
                  <a href="<?php echo $sort_address_1; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_address_1; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_address_1; ?>"><?php echo $column_address_1; ?></a>
                  <?php } ?></td>
                <td class="text-left"><?php if ($sort == 'z.name') { ?>
                  <a href="<?php echo $sort_zone; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_zone; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_zone; ?>"><?php echo $column_zone; ?></a>
                  <?php } ?></td>
                <td class="text-left"><?php if ($sort == 'c.name') { ?>
                  <a href="<?php echo $sort_country; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_country; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_country; ?>"><?php echo $column_country; ?></a>
                  <?php } ?></td>
                <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($location) { ?>
              <?php foreach ($location as $locations) { ?>
              <tr>
                <td class="text-center"><?php if ($locations['selected']) { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $locations['location_id']; ?>" checked="checked" />
                  <?php } else { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $locations['location_id']; ?>" />
                  <?php } ?></td>
                <td class="text-left"><?php echo $locations['name']; ?></td>
                <td class="text-left"><?php echo $locations['address_1']; ?></td>
                <td class="text-left"><?php echo $locations['zone']; ?></td>
                <td class="text-left"><?php echo $locations['country']; ?></td>
                <td class="text-right"><?php foreach ($locations['action'] as $action) { ?>
                  <a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="<?php echo $action['text']; ?>" class="btn btn-primary"><i class="icon-<?php echo $action['icon']; ?> icon-large"></i></a>
                  <?php } ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 