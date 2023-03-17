<div class="category-tab"><!--category-tab-->
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				
				<?php

					$i=0;
					foreach ($dataCat as $key => $value) {
					$i++;
					$class='';
					if($i==1){
						$class ='class="active"';
					}				
				?>

				<li <?php echo $class; ?> ><a href="#<?php echo $value["cat_name"]?>" data-toggle="tab"><?php echo $value["cat_name"]?></a></li>

				<?php } ?>		
				
			</ul>
		</div>
	<div class="tab-content">
				<?php
					$j= 0;
					foreach ($dataCat as $key => $value) {
					$j++;
					$class='';
					if($j==1){
						$class ='active';
					}				
				?>
		<div class="tab-pane fade <?=$class;?> in" id="<?php echo $value["cat_name"] ?>" >

			<div class="col-sm-3">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="images/home/gallery1.jpg" alt="" />
							<h2>$56</h2>
							<p>Easy Polo Black Edition</p>
							<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
						</div>
						
					</div>
				</div>
			</div>
			
		</div>

		<?php } ?>	

	</div>
</div><!--/category-tab-->
					
