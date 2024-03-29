<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-parallax" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                        class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li>
                        <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-parallax"
                      class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>

                        <div class="col-sm-10">
                            <input type="text" name="name" value="<?php echo $name; ?>"
                                   placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control"/>
                            <?php if ($error_name) { ?>
                                <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="tab-pane">
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-2">
                                <ul class="nav nav-tabs" id="language">
                                    <?php foreach ($languages as $language) { ?>
                                        <li>
                                            <a href="#language<?php echo $language['language_id']; ?>"
                                               data-toggle="tab"><img
                                                    src="view/image/flags/<?php echo $language['image']; ?>"
                                                    title="<?php echo $language['name']; ?>"/> <?php echo $language['name']; ?>
                                            </a>
                                        </li>
                                    <?php } ?>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-content">
                            <?php foreach ($languages as $language) { ?>
                                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                               for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>

                                        <div class="col-sm-10">
                                            <textarea
                                                name="description[<?php echo $language['language_id']; ?>][description]"
                                                placeholder="<?php echo $entry_description; ?>"
                                                id="input-description<?php echo $language['language_id']; ?>"
                                                class="form-control"><?php echo isset($description[$language['language_id']]['description']) ? $description[$language['language_id']]['description'] : ''; ?></textarea>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>

                        <div class="col-sm-10">
                            <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img
                                    src="<?php if ($image) {
                                        echo $image_thumb;
                                    } else {
                                        echo $placeholder;
                                    } ?>" alt="" title=""
                                    data-placeholder="<?php echo $placeholder; ?>"/></a>
                            <input class="form-control" type="hidden" name="image"
                                   value="<?php echo $image; ?>" id="input-image">
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>

                        <div class="col-sm-10">
                            <input type="text" name="width" value="<?php echo $width; ?>"
                                   placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control"/>
                            <?php if ($error_width) { ?>
                                <div class="text-danger"><?php echo $error_width; ?></div>
                            <?php } ?>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="input-height"><?php echo $entry_height; ?></label>

                        <div class="col-sm-10">
                            <input type="text" name="height" value="<?php echo $height; ?>"
                                   placeholder="<?php echo $entry_height; ?>" id="input-height"
                                   class="form-control"/>
                            <?php if ($error_height) { ?>
                                <div class="text-danger"><?php echo $error_height; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-css"><?php echo $entry_css; ?></label>

                        <div class="col-sm-10">
                            <input type="text" name="css" value="<?php echo $css; ?>"
                                   placeholder="<?php echo $entry_css; ?>" id="input-css" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="input-status"><?php echo $entry_status; ?></label>

                        <div class="col-sm-10">
                            <select name="status" id="input-status" class="form-control">
                                <?php if ($status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div id="modules">
                        <?php $modules_count = 0; ?>
                        <?php if ($module_id) { ?>
                            <?php for ($i = 0; $i <= sizeof($module_id) - 1; $i++) { ?>
                                <div class="module<?php echo $i ?>">
                                    <div class="form-group">
                                        <h4 class="col-sm-2 text-right">Module: <?php echo $i + 1; ?></h4>

                                        <div class="col-sm-10 text-right">
                                            <button type="button" onclick="removeModule(<?php echo $i ?>);"
                                                    data-toggle="tooltip"
                                                    title="<?php echo $text_remove_module; ?>" class="btn btn-danger"><i
                                                    class="fa fa-minus-circle"></i></button>
                                        </div>

                                        <div class="clearfix "></div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label"
                                               for="input-module<?php echo $i; ?>"><?php echo $entry_module; ?></label>

                                        <div class="col-sm-10">
                                            <select name="module_id[<?php echo $i; ?>]" id="input-module<?php echo $i; ?>" class="form-control">
                                                <?php foreach ($modules as $module) { ?>
                                                    <?php if ($module['module_id'] == $module_id[$i]) { ?>
                                                        <option value="<?php echo $module['module_id']; ?>"
                                                                selected="selected"><?php echo $module['name']; ?></option>
                                                    <?php } else { ?>
                                                        <option
                                                            value="<?php echo $module['module_id']; ?>"><?php echo $module['name']; ?></option>
                                                    <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <?php $modules_count++ ?>
                            <?php } ?>

                        <?php } ?>
                    </div>

                    <div class="text-right">
                        <button type="button" onclick="addModule();" data-toggle="tooltip"
                                title="<?php echo $text_add_module; ?>" class="btn btn-primary"><i
                                class="fa fa-plus-circle"></i></button>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>


<script type="text/javascript">
    var modules_count =<?php echo $modules_count; ?>;

    function addModule() {
        html = '<div class="module' + modules_count + '">';


        html += '<div class="form-group">';
        html += '	<h4 class="col-sm-2 text-right">Module: ' + (modules_count + 1) + '</h4>';
        html += '	<div class="col-sm-10 text-right">';
        html += '		  <button type="button" onclick="removeModule(' + modules_count + ');" data-toggle="tooltip" title="<?php echo $text_remove_module; ?>" class="btn btn-danger">' +
        '<i class="fa fa-minus-circle"></i></button>  ';
        html += '	</div>';
        html += '</div>';


        html += '<div class="form-group required">';
        html += '	<label class="col-sm-2 control-label" for="input-module' + modules_count + '"><?php echo $entry_module; ?></label>';
        html += '	<div class="col-sm-10">';
        html += '  <select name="module_id[' + modules_count + ']" id="input-module' + modules_count + '" class="form-control">';
        html += '  <option value="" selected="selected"><?php echo $text_none; ?></option>';
            <?php foreach ($modules as $module) { ?>
        html += '<option value="<?php echo $module['module_id']; ?>"><?php echo $module['name']; ?></option>';
        <?php } ?>
        html += '	</div>';
        html += '</div>';

        $('#modules').append(html);
        modules_count++;
    }

    function removeModule(index) {
        var el = '.module' + index;
        $(el).remove();
        $('.tooltip').remove();
    }
</script>

<script type="text/javascript"><!--
    <?php foreach ($languages as $language) { ?>
    $('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
    <?php } ?>
    //--></script>

<script type="text/javascript">
    $('#language a:first').tab('show');
</script>