<?php
/* @var $this yii\web\View */
use frontend\widgets\featuresitemsWidget;
use frontend\widgets\categorytabWidget;
use frontend\widgets\recommandedWidget;

$this->title = 'My Yii Application';

?>

<?= featuresitemsWidget::widget(); ?>
<?= categorytabWidget::widget(); ?>
<?= recommandedWidget::widget(); ?>