/* Webarch Admin Dashboard 
/* This JS is only for DEMO Purposes - Extract the code that you need
-----------------------------------------------------------------*/	
//Cool ios7 switch - Beta version
//Done using pure Javascript
if(!$('html').hasClass('lte9')) { 
var Switch = require('ios7-switch')
        , checkbox = document.querySelector('.ios')
        , mySwitch = new Switch(checkbox);
 mySwitch.toggle();
      mySwitch.el.addEventListener('click', function(e){
        e.preventDefault();
        mySwitch.toggle();
      }, false);
}

window.onbeforeunload = function (e) {
    e = e || window.event;

    // For IE and Firefox prior to version 4
    if (e) {
        e.returnValue = 'Any string';
    }

    // For Safari
    return 'Any string';
};

$(document).ready(function(){
	  //Dropdown menu - select2 plug-in
	  $("#player").select2();
	  $("#contract").select2();
	  $("#team").select2();

	  $("#section").select2();
	  $("#rubrique").select2();
	  $("#status").select2();
	  
	  //Multiselect - Select2 plug-in
	  $("#players").select2();
	  $("#teams").select2();
	  $("#matchs").select2();
	  $("#users").select2();
	  
	  // CKEDITOR


	var editor = CKEDITOR.replace( 'content', {
	    filebrowserBrowseUrl : 'ckfinder/ckfinder.html',
	    filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?type=Images',
	    filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?type=Flash',
	    filebrowserUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
	    filebrowserImageUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
	    filebrowserFlashUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash'
	});
	CKFinder.setupCKEditor( editor, '../' );

	
	CKEDITOR.editorConfig = function( config ) {
		config.language = 'fr';
		config.uiColor = '#F7B42C';
		config.height = 300;
		config.toolbarCanCollapse = true;
	};


	// var button1 = document.getElementById( 'ckfinder-popup-1' );

	// button1.onclick = function() {
	// 	selectFileWithCKFinder( 'ckfinder-input-1' );
	// };

	// function selectFileWithCKFinder( elementId ) {
	// 	CKFinder.modal( {
	// 		chooseFiles: true,
	// 		width: 800,
	// 		height: 600,
	// 		onInit: function( finder ) {
	// 			finder.on( 'files:choose', function( evt ) {
	// 				var file = evt.data.files.first();
	// 				var output = document.getElementById( elementId );
	// 				output.value = file.getUrl();
	// 			} );

	// 			finder.on( 'file:choose:resizedImage', function( evt ) {
	// 				var output = document.getElementById( elementId );
	// 				output.value = evt.data.resizedUrl;
	// 			} );
	// 		}
	// 	} );
	// }
     window.CKFinder = {
        _popupOptions: {
            'popup-1-config': { // Config ID for first popup
                chooseFiles: true,
                onInit: function( finder ) {
                    finder.on( 'files:choose', function( evt ) {
                        var file = evt.data.files.first();
                        var output = document.getElementById( 'image' );

                        var span = document.getElementById( 'img' );

                        output.value = file.getUrl();
                        span.src = file.getUrl();

                        //output.innerHTML = 'Selected in popup 1: ' + file.get( 'name' ) + '<br>URL: ' + file.getUrl();
                    } );
                }
            },
        }
    };

    var popupWindowOptions = [
        'location=no',
        'menubar=no',
        'toolbar=no',
        'dependent=yes',
        'minimizable=no',
        'modal=yes',
        'alwaysRaised=yes',
        'resizable=yes',
        'scrollbars=yes',
        'width=800',
        'height=600'
    ].join( ',' );

    document.getElementById( 'popup-1-button' ).onclick = function() {
        // Note that config ID is passed in configId parameter
        window.open( '../../assets/back/js/ckfinder/ckfinder.html?popup=1&configId=popup-1-config', 'CKFinderPopup1', popupWindowOptions );
    };

	  //Date Pickers
	  $('.input-append.date').datepicker({
			autoclose: true,
			todayHighlight: true
	   });

	  	//HTML5 editor
	$('#text-editor').wysihtml5({
		"color": true,
		'html': true
	});
	 
	 $('#dp5').datepicker({ dateFormat: 'dd-mm-yy' });
	 
	 $('#sandbox-advance').datepicker({
			format: "dd/mm/yyyy",
			startView: 1,
			daysOfWeekDisabled: "3,4",
			autoclose: true,
			todayHighlight: true
    });
	
	//Time pickers
	$('.clockpicker ').clockpicker({
        autoclose: true
    });
	//Color pickers
	//$('.my-colorpicker-control').colorpicker()
	
	//Input mask - Input helper
	$(function($){
	   $("#date").mask("99/99/9999");
	   $("#phone").mask("(999) 999-9999");
	   $("#tin").mask("99-9999999");
	   $("#ssn").mask("999-99-9999");
	});
	
	//Autonumeric plug-in - automatic addition of dollar signs,etc controlled by tag attributes
	$('.auto').autoNumeric('init');
	
	//Drag n Drop up-loader
	$("div#myId").dropzone({ url: "/file/post" });
	
	//Single instance of tag inputs  -  can be initiated with simply using data-role="tagsinput" attribute in any input field
	$('#source-tags').tagsinput({
		typeahead: {
			source: ['Amsterdam', 'Washington', 'Sydney', 'Beijing', 'Cairo']
		}	
	});
});