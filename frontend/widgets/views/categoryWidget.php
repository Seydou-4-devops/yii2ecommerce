<?php 

use frontend\models\Category;

?>

<h2>Category</h2>
<div class="panel-group category-products" id="accordian"><!--category-productsr-->

	<?php
	foreach ($dataParent as $key => $value) {
		$dataSub = new Category();
		$dataSub = $dataSub->getCategoryBy($value["cat_id"]);						
	?>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordian" href="#<?= $value["cat_name"]?>">
				
					<?php 
		
						if($dataSub){

					?>

				        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
				
				<?php } ?>

				<?php echo $value["cat_name"] ?>
				</a>
			</h4>
		</div>

			<?php 							
			if($dataSub){
			?>

		<div id="<?= $value["cat_name"]?>" class="panel-collapse collapse">
			<div class="panel-body">
				<ul>
					<?php
						foreach ($dataSub as $valueSub) {						
					?>

					<li><a href="#"><?php echo $valueSub["cat_name"] ?> </a></li>
					
					<?php } ?>

				</ul>
			</div>
		</div>

		<?php } ?>

	</div>

    <?php } ?>

</div><!--/category-products-->