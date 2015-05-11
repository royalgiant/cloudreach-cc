$(document).ready(
	function(){
		var regions;

	    regions = $('#contact_typ_regions_id').html();
	    $('#contact_typ_countries_id').change(function() {
		    var country, escaped_country, options;
		    country = $('#contact_typ_countries_id :selected').text();
		    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
		    options = $(regions).filter("optgroup[label='" + escaped_country + "']").html();
		    if (options) {
		        $('#contact_typ_regions_id').html(options).addClass('form-control');
		        return $('#contact_typ_regions_id').show();
		    } else {
		        $('#contact_typ_regions_id').empty(options);
		        return $('#contact_typ_regions_id').hide(options);
		    }
		});

	    // Let's hide these two forms when the page loads
	    $(".addTelephone").hide()
	    $(".addEmail").hide()
	    // If the Add Another Email button is clicked, show the add email form
	    $(".emailButton").click(function(){
	    	$(".addEmail").show()
	    	$(".emailButton, .telephoneButton").hide()
	    })
	    	
	    // If the Add Another Telephone Number button is clicked, show the add telephone number form
	    $(".telephoneButton").click(function(){
	    	$(".addTelephone").show()
	    	$(".emailButton, .telephoneButton").hide()
	    })
	    
	    // If any cancel button is clicked, we'll just hide everything
	    $(".cancelTelephoneButton, .cancelEmailButton").click(function(){
	    	$(".addTelephone").hide()
	    	$(".addEmail").hide()
	    	$(".emailButton, .telephoneButton").show()
	    });

	}
);