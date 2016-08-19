<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
	<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8">
	<![endif]-->
<!--[if IE 9 ]>
	<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9">
	<![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!-->
	<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
	<!--<![endif]-->
	<head>
		<meta charset="UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title><?php echo $title; ?></title>
		<base href="<?php echo $base; ?>"/>
		<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>"/>
		<?php } ?>
		<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>"/>
		<?php } ?>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!--    --><?php //if ($icon) { ?>
		<!--        <link href="--><?php //echo $icon; ?><!--" rel="icon"/>-->
		<!--    --><?php //} ?>

		<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
		<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
		<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">

		<link href='//fonts.googleapis.com/css?family=Ubuntu:400,300,500,700&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>

		<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/magnificent.css" rel="stylesheet">
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/photoswipe.css" rel="stylesheet">
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/js/fancybox/jquery.fancybox.css" rel="stylesheet">
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/material-design.css" rel="stylesheet">
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/material-icons.css" rel="stylesheet">
		<?php foreach ($links as $link) { ?>
		<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
		<?php } ?>

		<?php foreach ($styles as $style) { ?>
		<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
		media="<?php echo $style['media']; ?>"/>
		<?php } ?>
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/stylesheet.css" rel="stylesheet">

		<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
		<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/common.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>

		<!--custom script-->
		<?php foreach ($scripts as $script) { ?>
		<?php if (strcmp($script, 'catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js') != 0) { ?>
		<script src="<?php echo $script; ?>" type="text/javascript"></script>
		<?php } ?>
		<?php } ?>

		<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/device.min.js" type="text/javascript"></script>
		<!--[if lt IE 9]>
			<div style=' clear: both; text-align:center; position: relative;'>
				<a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
					<img src="catalog/view/theme/<?php echo $theme_path; ?>/image/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
				</a>
			</div>
			<![endif]-->
			<?php foreach ($analytics as $analytic) { ?>
			<?php echo $analytic; ?>
			<?php } ?>
		</head>
		<body class="<?php echo $class; ?>">
			<p id="gl_path" class="hidden"><?php echo $theme_path; ?></p>
			<div id="page">
				<header>
					<div class="top-line">
					<div class="container">
						<div class="fleft">
							<div id="logo" class="logo">
								<?php if ($logo) { ?>
								<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" style="height: 70px; margin-top: 0px;" /></a>
								<?php } else { ?>
								<h1>
									<a href="<?php echo $home; ?>"><?php echo $name; ?></a>
								</h1>
								<?php } ?>
							</div>
						</div>
						<div class="fright">
							<address class="material-icons-local_phone">
			                    <a href='callto:<?php echo $telephone; ?>'>Atendimento: <?php echo $telephone; ?></a>
			                </address>
			                <?php echo $currency; ?>
							<?php echo $language; ?>
							<ul class="top-menu">
								<li class="toggle-wrap">
		                            <?php if ($logged) { ?>
		                                <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"
		                                   class="toggle">
		                                    <i class="material-design-user157"></i>
		                                    <span><?php echo $text_account; ?></span>
		                                </a>
		                                <ul class="toggle_cont toggle_cont__right">
		                                    <li>
		                                        <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
		                                    </li>
		                                    <li>
		                                        <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
		                                    </li>
		                                    <li>
		                                        <a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>
		                                    </li>
		                                    <li>
		                                        <a href="<?php echo $download; ?>"><?php echo $text_download; ?></a>
		                                    </li>
		                                </ul>
		                            <?php } else { ?>
		                                <a href="<?php echo $register; ?>">
		                                    <i class="material-design-user157"></i>
		                                    <span><?php echo $text_account; ?></span>
		                                </a>
		                            <?php } ?>
		                        </li>
		                        <li>
		                            <?php if ($logged) { ?>
		                                <a href="<?php echo $logout; ?>">
		                                    <i class="material-icons-vpn_key"></i>
		                                    <span><?php echo $text_logout; ?></span>
		                                </a>
		                            <?php } else { ?>
		                                <a href="<?php echo $login; ?>">
		                                    <i class="material-icons-vpn_key"></i>
		                                    <span><?php echo $text_login; ?></span>
		                                </a>
		                            <?php } ?>
		                        </li>
		                        <li>
		                            <a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>">
		                            <!--<i class="material-design-double126"></i>-->
		                            <span><?php echo $text_checkout; ?></span>
		                            </a>
		                        </li>
							</ul>
						</div>
					</div>
					</div>
					<div class="container">
						<nav id="top-links" class="nav toggle-wrap">
							<a class="toggle material-design-settings49" href='#'></a>
							<ul class="toggle_cont">
								<li class="first">
									<a href="<?php echo $home; ?>" title="<?php echo $text_home; ?>" >
										<!-- <i class="material-design-home149"></i> -->
										<span><?php echo $text_home; ?></span>
									</a>
								</li>
								<li>
									<a href="<?php echo $compare; ?>" id="compare-total2" title="<?php echo $text_compare; ?>">
										<!-- <i class="material-design-shuffle24"></i> -->
										<span><?php echo $text_compare; ?></span>
									</a>
								</li>
								<li>
									<a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>">
										<!-- <i class="material-design-shopping232"></i> -->
										<span><?php echo $text_shopping_cart; ?></span>
									</a>
								</li>
								<li>
									<a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>">
										<!-- <i class="material-design-forward18"></i> -->
										<span><?php echo $text_checkout; ?></span>
									</a>
								</li>
							</ul>
						</nav>
					</div>

					<div id="stuck" class="stuck-menu">
						<div class="container">
							<?php /*
							<div class="fleft">
							<?php if ($navigation){?>
							<div class="navigation">
								<?php echo $navigation;?>
							</div>
							<?php }?>
							</div>
							*/ ?>

							<style>
							.icon-arcondicionado {
								background-image: url('image/aireacondicionado.png');
								padding-left: 35px;
								background-size: 30px;
								background-repeat: no-repeat;
								background-position: -1px;
							}
							.icon-tanquinhos {
								background-image: url('image/tanquinhos.png');
								padding-left: 32px;
								background-size: 35px;
								background-position: -1px;
								background-repeat: no-repeat;
							}
							.icon-lavadoras {
								background-image: url('image/lavadoras.png');
								padding-left: 32px;
								background-size: 35px;
								background-position: -1px;
								background-repeat: no-repeat;
							}
							.icon-ferramentas {
								background-image: url('image/ferramentas.png');
								padding-left: 32px;
								background-size: 35px;
								background-position: -1px;
								background-repeat: no-repeat;
							}
							.icon-refrigeradores {
								background-image: url('image/refrigerador2.png');
								padding-left: 32px;
								background-size: 35px;
								background-position: -1px;
								background-repeat: no-repeat;
							}
							.icon-microondas {
								background-image: url('image/microondas.png');
								padding-left: 32px;
								background-size: 35px;
								background-position: -1px;
								background-repeat: no-repeat;
							}
							</style>

							<div class="fleft">
								<div class="navigation">
									<div class="megamenu">
										<!--    <h3>--><!--</h3>-->

										<ul class="sf-menu sf-js-enabled sf-arrows">
											<li class="icon-refrigeradores">
												<a href="/refrigeradores">REFRIGERADORES</a>
											</li>
											<li class="icon-lavadoras">
												<a href="/lavadoras">LAVADORAS</a>
											</li>
											<li class="icon-microondas">
												<a href="/microondas">MICROONDAS</a>
											</li>
											<li class="icon-ferramentas">
												<a href="/ferramentas">FERRAMENTAS</a>
											</li>
											<li class="icon-arcondicionado">
												<a href="/ar-condicionado">AR CONDICIONADO</a>
											</li>
											<li class="icon-tanquinhos">
												<a href="/tanquinhos">TANQUINHOS</a>
											</li>
										</ul>
									</div>

										<?php /*
									<script>
									;
									(function ($) {
										$(window).load(function () {
											var o = $('.sf-menu');
											o.superfish();
											o.find('li a').each(function () {
												if ($(location).attr('href').indexOf($(this).attr('href')) >= 0){
													$(this).addClass('active');
													return;
												}
											})
											if (o.parents('aside').length){
												var width = $('.container').outerWidth() - $('aside').outerWidth();
												o.find('.sf-mega').each(function () {
													$(this).width(width);
												})
											}
										});
									})(jQuery);

									</script>
								</div>
							</div>

							<div class="fright">
								<?php echo $search; ?>
									<div>
										<div style="float: left; margin: 30px 25px;"><a class="wish_button" href="<?php echo $wishlist; ?>">
												<i class="material-icons-favorite_border"></i>
												<span id="wishlist-total"></span>
												</a>
										</div>
										<div style="float: left; margin: 30px 0px;">
		                	<?php echo $cart; ?>
										</div>
	                </div>
              </div>
							*/ ?>
						</div>
					</div>



					<?php if ($header_top) { ?>
					<div class="header_modules"><?php echo $header_top; ?></div>
					<?php } ?>

				</header>
