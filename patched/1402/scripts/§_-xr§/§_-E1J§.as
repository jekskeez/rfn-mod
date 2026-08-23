package §_-xr§
{
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-E1J§ extends Dialog
   {
      
      private static const §_-W2P§:TextFormat = new TextFormat(null,15,7625799,true);
      
      public function §_-E1J§()
      {
         super(gls("Обучение завершено!"),true,true,null,false);
         this.init();
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,24,16763904,null,null,null,null,null,"center");
      }
      
      override protected function redrawModalBackdrop() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.3);
         this.graphics.drawRect(-this.x,-this.y,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
      }
      
      private function init() : void
      {
         var _loc1_:EducationWelcomeImage = new EducationWelcomeImage();
         _loc1_.y = 5;
         _loc1_.imageShaman.imageHandWelcome.visible = false;
         addChild(_loc1_);
         addChild(new §_-i5§(gls("Вот и окончилось твоё обучение.\nТеперь ты знаешь всё, что надо знать белке\nдля успешной игры.\n\nВпереди тебя ждёт ещё не мало новых\nприключений и увлекательных событий."),300,19,§_-W2P§));
         addChild(new §_-i5§(gls("Если захочешь мне помочь, у меня\nвсегда есть для тебя парочка новых\nпоручений.\n\nТы сможешь узнать о них побольше\nкликнув по кнопке заданий."),300,163,§_-W2P§));
         var _loc2_:§_-K2G§ = new §_-K2G§(gls("Продолжить"));
         _loc2_.x = 415;
         _loc2_.y = 325;
         _loc2_.addEventListener(MouseEvent.CLICK,hide);
         addChild(_loc2_);
         place();
         this.height = 505;
         this.redrawModalBackdrop();
      }
   }
}

