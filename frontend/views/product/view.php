<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model frontend\models\Product */

$this->title = $model->prod_id;
$this->params['breadcrumbs'][] = ['label' => 'Products', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="product-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->prod_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->prod_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'prod_id',
            'prod_name',
            'prod_image',
            'prod_price',
            'prod_sale_off',
            'cat_id',
            'supplier_id',
            'pro_size',
            'pro_color',
            'pro_made_id',
            'description:ntext',
            'status',
            'begin_date_sale_off',
            'end_date_sale_off',
            'meta_keyword',
            'meta_description:ntext',
            'created_at',
            'updated_at',
        ],
    ]) ?>

</div>
