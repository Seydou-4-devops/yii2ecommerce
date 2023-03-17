<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "category".
 *
 * @property int $cat_id
 * @property string $cat_name
 * @property int $parent_id
 * @property string $cat_icon
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 * @property string $meta_keyword
 * @property string $meta_description
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cat_name', 'parent_id', 'cat_icon', 'status', 'meta_keyword', 'meta_description'], 'required'],
            [['parent_id', 'status'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['meta_description'], 'string'],
            [['cat_name', 'cat_icon'], 'string', 'max' => 100],
            [['meta_keyword'], 'string', 'max' => 200],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'cat_id' => 'Cat ID',
            'cat_name' => 'Cat Name',
            'parent_id' => 'Parent ID',
            'cat_icon' => 'Cat Icon',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'meta_keyword' => 'Meta Keyword',
            'meta_description' => 'Meta Description',
        ];
    }

    /**
     * {@inheritdoc}
     * @return CategoryQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CategoryQuery(get_called_class());
    }
    public function getCategoryBy($parentid = 0){
        $data = Category::find()->asArray()->where('parent_id=:parentid AND status = 1',['parentid'=>$parentid])->all();
        return $data;
    }

    public function getDataTabHomepage($parentid = 0,$limit = 5){
        
        $data = Category::find()->asArray()->where('parent_id !=:parentid AND status = 1',['parentid'=>$parentid])->limit($limit)
        ->orderBy('rand()')->all();
        return $data;
    }
}
