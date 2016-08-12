<div id="search-block" class="search toggle-wrap fix-right">
	<i class="material-icons-search toggle"><span class="material-icons-clear"></span></i>
	<div id="search" class="toggle_cont">
		<input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>"  />
		<button type="button" class="button-search"></button>
	</div>
	<script>
	;(function ($) {
		function SearchWidth() {
			$("#search-block .toggle_cont").css("width", ($(".container").width()-30));
		}
		$(document).ready(SearchWidth);
		$(window).resize(SearchWidth);
	})(jQuery);
	</script>
</div>

