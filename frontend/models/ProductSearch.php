<?php

namespace frontend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\Product;

/**
 * ProductSearch represents the model behind the search form of `frontend\models\Product`.
 */
class ProductSearch extends Product
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['prod_id', 'prod_price', 'cat_id', 'supplier_id', 'pro_made_id', 'status'], 'integer'],
            [['prod_name', 'prod_image', 'prod_sale_off', 'pro_size', 'pro_color', 'description', 'begin_date_sale_off', 'end_date_sale_off', 'meta_keyword', 'meta_description', 'created_at', 'updated_at'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Product::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'prod_id' => $this->prod_id,
            'prod_price' => $this->prod_price,
            'cat_id' => $this->cat_id,
            'supplier_id' => $this->supplier_id,
            'pro_made_id' => $this->pro_made_id,
            'status' => $this->status,
            'begin_date_sale_off' => $this->begin_date_sale_off,
            'end_date_sale_off' => $this->end_date_sale_off,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'prod_name', $this->prod_name])
            ->andFilterWhere(['like', 'prod_image', $this->prod_image])
            ->andFilterWhere(['like', 'prod_sale_off', $this->prod_sale_off])
            ->andFilterWhere(['like', 'pro_size', $this->pro_size])
            ->andFilterWhere(['like', 'pro_color', $this->pro_color])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'meta_keyword', $this->meta_keyword])
            ->andFilterWhere(['like', 'meta_description', $this->meta_description]);

        return $dataProvider;
    }
}
