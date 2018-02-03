<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title>Webarch - Responsive Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN PLUGIN CSS -->
    <link href="<?php echo $link; ?>/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $link; ?>/plugins/bootstrap-tag/bootstrap-tagsinput.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $link; ?>/plugins/dropzone/css/dropzone.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $link; ?>/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $link; ?>/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $link; ?>/plugins/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $link; ?>/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $link; ?>/plugins/ios-switch/ios7-switch.css" rel="stylesheet" type="text/css" media="screen">
    <link href="<?php echo $link; ?>/plugins/bootstrap-select2/select2.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="<?php echo $link; ?>/plugins/boostrap-clockpicker/bootstrap-clockpicker.min.css" rel="stylesheet" type="text/css" media="screen" />
    <!-- END PLUGIN CSS -->
    <!-- BEGIN PLUGIN CSS -->
    <link href="<?php echo $link; ?>/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="<?php echo $link; ?>/plugins/bootstrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $link; ?>/plugins/bootstrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="<?php echo $link; ?>/plugins/animate.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo $link; ?>/plugins/jquery-scrollbar/jquery.scrollbar.css" rel="stylesheet" type="text/css" />
    <!-- END PLUGIN CSS -->
    <!-- BEGIN CORE CSS FRAMEWORK -->
    <link href="<?php echo $link; ?>/webarch/css/webarch.css" rel="stylesheet" type="text/css" />
    <!-- END CORE CSS FRAMEWORK -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="">
    <?php $this->view('back/menu'); ?>
    <div class="page-container row">
        <?php $this->view('back/sidebar'); ?>
        <div class="page-content">
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <div id="portlet-config" class="modal hide">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"></button>
                    <h3>Widget Settings</h3>
                </div>
                <div class="modal-body"> Widget settings form goes here </div>
            </div>
            <div class="clearfix"></div>
            <div class="content">
                <ul class="breadcrumb">
                    <li>
                        <p>YOU ARE HERE</p>
                    </li>
                    <li><a href="#" class="active">Form Elements</a> </li>
                </ul>
                <div class="page-title"> <i class="icon-custom-left"></i>
                    <h3>Form - <span class="semi-bold">Elements</span></h3>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label class="form-label">Joueurs</label>
                        <span class="help">Joueurs associés à l'article</span>
                        <div class="controls">
                            <select name="players[]" id="player" style="width:100%" multiple>
                                <?php
                                foreach ($players as $player): ?>
                                    <option
                                        <?php
                                        if($type == "edit"):
                                            if (isset($postPlayer)):
                                                foreach ($postPlayer as $value):
                                                    $thePlayer = ($player["id"] == $value) ? "selected='selected'" : ""; echo $thePlayer;
                                                endforeach;
                                            endif;
                                        endif;
                                        ?> value="<?php echo $player['id']; ?>"><?php echo $player['firstname'].' '.$player['lastname']; ?></option>
                                    <?php
                                endforeach;
                                ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                            <div class="form-group">
                                <label class="form-label">Clubs</label>
                                <span class="help">Club(s) associé(s) à l'article</span>
                                <div class="controls">
                                    <select name="teams[]" id="team" style="width:100%" multiple>
                                        <?php foreach ($clubs as $club):?>
                                            <option
                                                <?php
                                                if($type == "edit"):
                                                    if (isset($postTeams)):
                                                        foreach ($postTeams as $value):
                                                            $team = ($club["id"] == $value["id_team"]) ? "selected='selected'" : ""; echo $team;
                                                        endforeach;
                                                    endif;
                                                endif;
                                                ?>
                                            value="<?php echo $club["id"]; ?>"><?php echo $club["name"]; ?></option>
                                        <?php endforeach;?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Matchs</label>
                                <span class="help">Matchs associés à l'article</span>
                                <div class="controls">
                                    <select name="games[]" id="match" style="width:100%" multiple>
                                        <?php foreach ($matchs as $match):
                                            ?>
                                            <option
                                                <?php
                                                if($type == "edit"):
                                                    if (isset($postMatch)):
                                                        foreach ($postMatch as $value):
                                                            $team = ($match["id"] == $value) ? "selected='selected'" : ""; echo $team;
                                                        endforeach;
                                                    endif;
                                                endif;
                                                ?>
                                            value="<?php echo $match['id']; ?>"><?php echo $this->games_model->getNameTeam($match['id_home']).' - '.$this->games_model->getNameTeam($match['id_away']); ?></option>
                                        <?php endforeach;?>
                                    </select>
                                </div>
                            </div>
                </div>
                <!-- END BASIC FORM ELEMENTS-->
                <!-- BEGIN RADIO/TOGGLE CONTROLS-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="grid simple">
                            <div class="grid-title no-border">
                                <h4>Toggle <span class="semi-bold">Controls</span></h4>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#grid-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>
                            </div>
                            <div class="grid-body no-border">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h3>Color <span class="semi-bold">Options</span></h3>
                                        <p>Pure CSS radio button with a cool animation. These are available in all primary colors in bootstrap</p>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="radio">
                                                    <input id="male" type="radio" name="gender" value="male" checked="checked">
                                                    <label for="male">Male</label>
                                                    <input id="female" type="radio" name="gender" value="female">
                                                    <label for="female">Female</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="radio radio-success">
                                                    <input id="yes" type="radio" name="optionyes" value="yes">
                                                    <label for="yes">Agree</label>
                                                    <input id="no" type="radio" name="optionyes" value="no" checked="checked">
                                                    <label for="no">Disagree</label>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <br>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="col-md-4">
                                        <h3>State <span class="semi-bold">Options</span></h3>
                                        <p>Use of different color opacity helps to destigues between different states such as disable</p>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="radio radio-primary">
                                                    <input id="Disabled" type="radio" name="Disabled" value="Disabled" disabled="disabled">
                                                    <label for="Disabled">Disabled</label>
                                                    <input id="ADisabled" type="radio" name="ADisabled" value="ADisabled" checked="checked" disabled="disabled">
                                                    <label for="ADisabled">Disabled</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <h3>Slide <span class="semi-bold">Toggle</span></h3>
                                        <p>A cool iOS7 slide toggle. These are cutomize for all boostrap colors</p>
                                        <br>
                                        <div class="row-fluid">
                                            <div class="slide-primary">
                                                <input type="checkbox" name="switch" class="ios" checked="checked" />
                                            </div>
                                            <div class="slide-success">
                                                <input type="checkbox" name="switch" class="iosblue" checked="checked" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END RADIO/TOGGLE CONTROLS-->
                <!-- BEGIN DATEPICKER CONTROLS-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="grid simple">
                            <div class="grid-title no-border">
                                <h4>Date <span class="semi-bold">Controls</span></h4>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#grid-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>
                            </div>
                            <div class="grid-body no-border">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h3>Simple  Date<span class="semi-bold"> Picker</span></h3>
                                        <p>Date picker is powered by boostrap date picker, this is customized in way that it suites our theme and design, Have a look!</p>
                                        <br>
                                        <div class="input-append success date col-md-10 col-lg-6 no-padding">
                                            <input type="text" class="form-control">
                                            <span class="add-on"><span class="arrow"></span><i class="fa fa-th"></i></span>
                                        </div>
                                        <br>
                                        <br>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="col-md-4">
                                        <h3>Over<span class="semi-bold">view</span></h3>
                                        <p>Here is an attached calender in case you want to see how it looks like, this is only used for a demo purpose</p>
                                        <br>
                                        <div id="dp5" data-date="12-02-2013" data-date-format="dd-mm-yyyy"></div>
                                    </div>
                                    <div class="col-md-4">
                                        <h3>Advance <span class="semi-bold">Settings</span></h3>
                                        <p>Some advance setting that you can do with this calender, like to start from years an disable sections of dates</p>
                                        <br>
                                        <div class="input-append success date col-md-10 col-lg-6">
                                            <input type="text" class="form-control" id="sandbox-advance">
                                            <span class="add-on"><span class="arrow"></span><i class="fa fa-th"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- BEGIN TIMEPICKER/COLORPICKER CONTROLS-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="grid simple">
                            <div class="grid-title no-border">
                                <h4>Time <span class="semi-bold">Controls</span></h4>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#grid-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>
                            </div>
                            <div class="grid-body no-border">
                                <h3>Simple Time <span class="semi-bold">Picker</span></h3>
                                <p>This is a time picker controller that can be customized for both 24hour and 12 hour clocks</p>
                                <br>
                                <div class="form-group">
                                    <label class="form-label">Default Timepicker</label>
                                    <div class="controls">
                                        <div class="input-group transparent clockpicker col-md-6">
                                            <input type="text" class="form-control" placeholder="Pick a time">
                                            <span class="input-group-addon ">
                                                <i class="fa fa-clock-o"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="grid simple">
                            <div class="grid-title no-border">
                                <h4>Color <span class="semi-bold">Controls</span></h4>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#grid-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>
                            </div>
                            <div class="grid-body no-border">
                                <h3>Color <span class="semi-bold">Picker</span></h3>
                                <p>Hardly used but we included it too, You can pick a color and return it to any element you want</p>
                                <br>
                                <a data-color="rgb(255, 255, 255)" data-color-format="hex" id="cp4" class="btn btn-primary my-colorpicker-control" href="#" data-colorpicker-guid="8">Change background color</a>
                                <br>
                                <br>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END TIMEPICKER/COLORPICKER CONTROLS-->
                <!-- BEGIN INPUT HELPERS CONTROLS-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="grid simple">
                            <div class="grid-title no-border">
                                <h4>Input <span class="semi-bold">Helpers</span></h4>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#grid-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>
                            </div>
                            <div class="grid-body no-border">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3>Input <span class="semi-bold">Masks</span></h3>
                                        <p>These assure the user will never enter invalid phone no, email or anything that has a pattern even without validations</p>
                                        <br>
                                        <div class="form-group">
                                            <label class="form-label">Date</label>
                                            <span class="help">e.g. "25/12/2013"</span>
                                            <div class="controls">
                                                <input type="text" class="form-control" id="date">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Telephone</label>
                                            <span class="help">e.g. "(324) 234-3243"</span>
                                            <div class="controls">
                                                <input type="text" class="form-control" id="phone">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Custom</label>
                                            <span class="help">e.g. "23-4324324"</span>
                                            <div class="controls">
                                                <input type="text" class="form-control" id="tin">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Social Security Number</label>
                                            <span class="help">e.g. "432-43-2432"</span>
                                            <div class="controls">
                                                <input type="text" placeholder="You can put anything here" class="form-control" id="ssn">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h3>Input <span class="semi-bold">autonumeric</span></h3>
                                        <p>Do you forget small things? here is something that helps to automatically placed forgotten dollar signs, decimal places and even comma separates and many more!</p>
                                        <br>
                                        <div class="form-group">
                                            <label class="form-label">Decimal place and comma separator</label>
                                            <span class="help">e.g. "53,000.00"</span>
                                            <div class="controls">
                                                <input type="text" class="form-control auto" data-a-sep="," data-a-dec=".">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Weird way but works</label>
                                            <span class="help">e.g. "45.000,00"</span>
                                            <div class="controls">
                                                <input type="text" class="form-control auto" data-a-sep="." data-a-dec=",">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Dollar prefix</label>
                                            <span class="help">e.g. "$45.50"</span>
                                            <div class="controls">
                                                <input type="text" class="form-control auto" data-a-sign="$ ">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Range</label>
                                            <span class="help">e.g. "0 - 9,999"</span>
                                            <div class="controls">
                                                <input type="text" class="form-control auto" data-v-max="9999" data-v-min="0">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END INPUT HELPERS CONTROLS-->
                <!-- BEGIN HTML5 WYSIWG CONTROLS-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="grid simple">
                            <div class="grid-title no-border">
                                <h4>HTML5 <span class="semi-bold">WYSIWYG</span></h4>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#grid-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>
                            </div>
                            <div class="grid-body no-border">
                                <h3>Simple <span class="semi-bold">Editor</span></h3>
                                <p>Simple, elegant WYSIYG editor that acts as a word editor all necessary actions that is required to type simple content with style is available in this editor. Its powererd by HTML5 WYSIYG editor which will work even on any mobile device. Simply place it any <code>textarea</code> </p>
                                <br>
                                <textarea id="text-editor" placeholder="Enter text ..." class="form-control" rows="10"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END HTML5 WYSIWG CONTROLS-->
                <!-- BEGIN TAG INPUTS / FILE UPLOADER CONTROLS-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="grid simple">
                                    <div class="grid-title no-border">
                                        <h4>Tags <span class="semi-bold">Input</span></h4>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"></a>
                                            <a href="#grid-config" data-toggle="modal" class="config"></a>
                                            <a href="javascript:;" class="reload"></a>
                                            <a href="javascript:;" class="remove"></a>
                                        </div>
                                    </div>
                                    <div class="grid-body no-border">
                                        <div class="row-fluid">
                                            <h3>Tag <span class="semi-bold">Input</span></h3>
                                            <p>Do you use tags to organize content on your site? This plugin will turn your boring tag list into a magical input that turns each tag into a style-able object with its own delete link. </p>
                                            <br>
                                            <input class="span12 tagsinput" type="text" value="Amsterdam,Washington" data-role="tagsinput" />
                                            <input class="span12 tagsinput" type="text" value="johnsmith@webarc.com,janesmith@webarc.com" data-role="tagsinput" />
                                            <input class="span12 tagsinput" id="source-tags" type="text" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="grid simple">
                                    <div class="grid-title no-border">
                                        <h4>Drag n Drop <span class="semi-bold">Uploader</span></h4>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"></a>
                                            <a href="#grid-config" data-toggle="modal" class="config"></a>
                                            <a href="javascript:;" class="reload"></a>
                                            <a href="javascript:;" class="remove"></a>
                                        </div>
                                    </div>
                                    <div class="grid-body no-border">
                                        <div class="row-fluid">
                                            <form action="/file-upload" class="dropzone no-margin">
                                                <div class="fallback">
                                                    <input name="file" type="file" multiple />
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END TAG INPUTS / FILE UPLOADER CONTROLS-->
                <!-- END PAGE -->
            </div>
        </div>
        <?php $this->view('back/chat'); ?>
    </div>
    <!-- END CONTAINER -->
    <script src="<?php echo $link; ?>/plugins/pace/pace.min.js" type="text/javascript"></script>
    <!-- BEGIN JS DEPENDECENCIES-->
    <script src="<?php echo $link; ?>/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/bootstrapv3/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/jquery-block-ui/jqueryblockui.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/jquery-unveil/jquery.unveil.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/jquery-scrollbar/jquery.scrollbar.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/jquery-numberAnimate/jquery.animateNumbers.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/bootstrap-select2/select2.min.js" type="text/javascript"></script>
    <!-- END CORE JS DEPENDECENCIES-->
    <!-- BEGIN CORE TEMPLATE JS -->
    <script src="<?php echo $link; ?>/webarch/js/webarch.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/js/chat.js" type="text/javascript"></script>
    <!-- END CORE TEMPLATE JS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="<?php echo $link; ?>/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/jquery-inputmask/jquery.inputmask.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/jquery-autonumeric/autoNumeric.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/ios-switch/ios7-switch.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/bootstrap-select2/select2.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/bootstrap-tag/bootstrap-tagsinput.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/boostrap-clockpicker/bootstrap-clockpicker.min.js" type="text/javascript"></script>
    <script src="<?php echo $link; ?>/plugins/dropzone/dropzone.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="<?php echo $link; ?>/js/form_elements.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- END JAVASCRIPTS -->
</body>
</html>