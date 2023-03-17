<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "product".
 *
 * @property int $prod_id
 * @property string $prod_name
 * @property string $prod_image
 * @property int $prod_price
 * @property string $prod_sale_off
 * @property int $cat_id
 * @property int $supplier_id
 * @property string $pro_size
 * @property string $pro_color
 * @property int $pro_made_id
 * @property string $description
 * @property int $status
 * @property string $begin_date_sale_off
 * @property string $end_date_sale_off
 * @property string $meta_keyword
 * @property string $meta_description
 * @property string $created_at
 * @property string $updated_at
 */
class Product extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['prod_name', 'prod_image', 'prod_price', 'prod_sale_off', 'cat_id', 'supplier_id', 'pro_size', 'pro_color', 'pro_made_id', 'description', 'status', 'begin_date_sale_off', 'end_date_sale_off', 'meta_keyword', 'meta_description'], 'required'],
            [['prod_price', 'cat_id', 'supplier_id', 'pro_made_id', 'status'], 'integer'],
            [['description', 'meta_description'], 'string'],
            [['begin_date_sale_off', 'end_date_sale_off', 'created_at', 'updated_at'], 'safe'],
            [['prod_name', 'prod_sale_off', 'meta_keyword'], 'string', 'max' => 100],
            [['prod_image'], 'string', 'max' => 200],
            [['pro_size', 'pro_color'], 'string', 'max' => 10],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'prod_id' => 'Prod ID',
            'prod_name' => 'Prod Name',
            'prod_image' => 'Prod Image',
            'prod_price' => 'Prod Price',
            'prod_sale_off' => 'Prod Sale Off',
            'cat_id' => 'Cat ID',
            'supplier_id' => 'Supplier ID',
            'pro_size' => 'Pro Size',
            'pro_color' => 'Pro Color',
            'pro_made_id' => 'Pro Made ID',
            'description' => 'Description',
            'status' => 'Status',
            'begin_date_sale_off' => 'Begin Date Sale Off',
            'end_date_sale_off' => 'End Date Sale Off',
            'meta_keyword' => 'Meta Keyword',
            'meta_description' => 'Meta Description',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * {@inheritdoc}
     * @return ProductQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ProductQuery(get_called_class());
    }

    public function getdataProduct($limit = 6 ){

        $data = Product::find()->asArray()->limit($limit)->orderBy('rand()')->all(); 

        return $data;
    }
}
