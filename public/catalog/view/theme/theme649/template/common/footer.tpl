<div style="width: 1000px; text-align: center; margin: auto; padding-bottom: 30px;">
  <div style="float: left; text-transform: uppercase;">Formas de pagamento:</div><br>
  <img src="/image/pagseguro-line.png" style="width: 100%;" width="100%">
</div>

<footer>

    <div class="container">
        <div class="row" style="padding-bottom: 30px;">
            <div class="col-xs-6 col-sm-4 col-md-2">
                <?php if ($informations) { ?>
                    <div class="footer_box">
                        <h5><?php echo $text_information; ?></h5>
                        <ul class="list-unstyled">
                            <?php foreach ($informations as $information) { ?>
                                <li>
                                    <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
                                </li>
                            <?php } ?>
                        </ul>
                    </div>
                <?php } ?>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2">
                <div class="footer_box">
                    <h5><?php echo $text_service; ?></h5>
                    <ul class="list-unstyled">
                        <li>
                            <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
                        </li>
                        <li>
                            <a href="<?php echo $return; ?>"><?php echo $text_return; ?></a>
                        </li>
                        <li>
                            <a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2">
                <div class="footer_box">
                    <h5><?php echo $text_extra; ?></h5>
                    <ul class="list-unstyled">
                        <li>
                            <a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a>
                        </li>
                        <li>
                            <a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a>
                        </li>
                        <li>
                            <a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a>
                        </li>
                        <li>
                            <a href="<?php echo $special; ?>"><?php echo $text_special; ?></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-2">
                <div class="footer_box">
                    <h5><?php echo $text_account; ?></h5>
                    <ul class="list-unstyled">
                        <li>
                            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                        </li>
                        <li>
                            <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
                        </li>
                        <li>
                            <a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a>
                        </li>
                        <li>
                            <a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-xs-6 col-sm-4 col-md-4" style="padding-left: 84px;">
                <div class="logo-block">
                    <a href="./"><img src="image/catalog/logo_branco.png" alt="" style="max-width: 170px; margin-left: 30px;"></a>
                </div>
                <address>
                    <i class="material-icons-location_on"></i>
                    <a href="//maps.google.com/?q=<?php echo(strip_tags($address)); ?>">
                        <?php echo $address ?>
                    </a>
                </address>
                <address>
                    <i class="material-icons-phone"></i>
                    <a href="callto:<?php echo $telephone; ?>"><?php echo $telephone; ?></a>
                </address>
                <address>
                    <i class="material-icons-email"></i>
                    <a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a>
                </address>
                <address>
                    <i class="material-icons-schedule"></i>
                    <span><?php echo $open; ?></span>
                </address>
            </div>
            <!--
            <div class="col-xs-6 col-sm-4 col-md-2">
                <div class="footer_box">
                    <?php echo $tm_social_list; ?>
                </div>
            </div>
            -->
        </div>

    </div>

    <div class="copyright bot-line" style="margin-left: 15px; margin-right: 15px; margin: auto; width: 1170px; color: #333">
        <div style="width: 60%; padding-top: 30px; float: left; padding-bottom: 27px;">
            <?php echo $powered; ?><!-- [[%FOOTER_LINK]] -->
        </div>

        <div style="width: 40%; float: left; padding-top: 25px; text-align: right;">

          <a href="http://pagseguro.uol.com.br" target="_blank">
            <img src="/image/pagseguro.png" alt="PagSeguro" height="26" style="border: 0px; margin-right: 20px; height: 26px;">
          </a>

          <a href="http://www.correios.com.br/" target="_blank">
            <img src="/image/correios.png" alt="Correios"  height="26" style="border: 0px; height: 26px;">
          </a>
          </div>
    </div>



</footer>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/livesearch.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/script.js" type="text/javascript"></script>
</div>

<div class="ajax-overlay"></div>
<script src="https://lojavirtual.digital/lojavirtualfooter.js" type="text/javascript"></script>
</body></html>
