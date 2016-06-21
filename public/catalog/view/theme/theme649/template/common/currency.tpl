<?php if (count($currencies) > 1) { ?>
<div class="box-currency">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
  <ul class="currency-list">
  	<?php foreach ($currencies as $currency) { ?>
	  	<li>
	  		<?php if ($currency['code'] == $code) { ?>
		  		<button class="active currency-select" type="button" name="<?php echo $currency['code']; ?>">
		  			<?php echo $currency['symbol_left']; ?>
		  			<?php echo $currency['symbol_right']; ?>
		  		</button>
		  		<?php } else { ?>
				<button class="currency-select" type="button" name="<?php echo $currency['code']; ?>">
		  			<?php echo $currency['symbol_left']; ?>
		  			<?php echo $currency['symbol_right']; ?>
		  		</button>
	  		<?php } ?>
	  	</li>
  	<?php } ?>
  </ul>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
