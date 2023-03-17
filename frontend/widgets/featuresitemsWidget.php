<?php

namespace frontend\widgets;

use frontend\models\Product;
use yii\base\Widget;
use yii\helpers\Html;
// use frontend\models\Product;

class featuresitemsWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
       
    }

    public function run()
    {
        $product = new Product();
        $product = $product->getdataProduct();
        return $this->render('featuresitemsWidget',['data'=>$product]);

    }
}

?>