<?php 

use frontend\models\Product;

?>

<div class="features_items"><!--features_items-->

<h2 class="title text-center">Features Items</h2>

		<?php

			foreach ($data as $key => $value) {
							
		?>

<div class="col-sm-4">
	<div class="product-image-wrapper">
		<div class="single-products">
				<div class="productinfo text-center">
					<img src="<?= $value["prod_image"] ?>" alt="<?= $value["prod_name"] ?>" />

					<h2>$<?php echo $value["prod_price"] ?></h2>

					<p><a href="#"><?= $value["prod_name"] ?></a></p>

					<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
				</div>
				<div class="product-overlay">
					<div class="overlay-content">
						<h2>$56</h2>
						<p>Easy Polo Black Edition</p>
						<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
					</div>
				</div>
		</div>
		<div class="choose">
			<ul class="nav nav-pills nav-justified">
				<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
				<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
			</ul>
		</div>
	</div>
</div>

	<?php } ?>

</div><!--features_items-->