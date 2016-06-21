<?php if (count($languages) > 1) { ?>
<div class="box-language">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">

  <ul class="language-list">
  	<?php foreach ($languages as $language) { ?>
	  	<li>
	  		<?php if ($language['code'] == $code) { ?>
		  		<a class="active" href="<?php echo $language['code']; ?>">
		  			<?php echo $language['code']; ?>
		  		</a>
		  		<?php } else { ?>
				<a href="<?php echo $language['code']; ?>">
		  			<?php echo $language['code']; ?>
		  		</a>
	  		<?php } ?>
	  	</li>
  	<?php } ?>
  </ul>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
