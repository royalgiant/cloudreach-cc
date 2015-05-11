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
	}
);