<?php

namespace frontend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use frontend\models\Category;

/**
 * CategorySearch represents the model behind the search form of `frontend\models\Category`.
 */
class CategorySearch extends Category
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cat_id', 'parent_id', 'status'], 'integer'],
            [['cat_name', 'cat_icon', 'created_at', 'updated_at', 'meta_keyword', 'meta_description'], 'safe'],
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
        $query = Category::find();

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
            'cat_id' => $this->cat_id,
            'parent_id' => $this->parent_id,
            'status' => $this->status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'cat_name', $this->cat_name])
            ->andFilterWhere(['like', 'cat_icon', $this->cat_icon])
            ->andFilterWhere(['like', 'meta_keyword', $this->meta_keyword])
            ->andFilterWhere(['like', 'meta_description', $this->meta_description]);

        return $dataProvider;
    }
}
