package §_-6f§
{
   import §_-92Z§.§_-v1R§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-j2O§;
   import views.§_-i2V§;
   
   public class §_-a2M§ extends Dialog
   {
      
      protected var §_-p2o§:§_-K2G§ = null;
      
      protected var §_-KU§:Sprite = null;
      
      protected var §_-DB§:Sprite = null;
      
      public function §_-a2M§()
      {
         super(gls("Золото Лепрекона теперь твоё!"),false,true);
         this.init();
      }
      
      override public function get captured() : Boolean
      {
         return true;
      }
      
      protected function init() : void
      {
         var _loc1_:DialogGoldenCup = new DialogGoldenCup();
         addChild(_loc1_);
         this.§_-KU§ = new LeprechaunCap();
         this.§_-KU§.x = 180;
         this.§_-KU§.y = 120;
         addChild(this.§_-KU§);
         this.§_-DB§ = new §_-i2V§();
         this.§_-DB§.scaleX = this.§_-DB§.scaleY = 1.3;
         this.§_-DB§.x = 40;
         this.§_-DB§.y = 150;
         addChild(this.§_-DB§);
         place();
         this.height = 450;
         this.§_-p2o§ = new §_-K2G§(gls("Рассказать друзьям"),170,14,this.§_-Zt§);
         this.§_-p2o§.x = int((this.width - this.§_-p2o§.width) * 0.5);
         this.§_-p2o§.y = this.height - this.§_-p2o§.height - 10;
         addChild(this.§_-p2o§);
         this.§_-Y1T§.y = 10;
         this.§_-Y1T§.setTextFormat(FORMAT_CAPTION_29_CENTER);
         this.§_-Y1T§.width -= this.§_-x2T§.width * 2;
         this.§_-x2T§.x = this.width - this.§_-x2T§.width * 1.5;
         this.§_-x2T§.y = this.§_-x2T§.height * 0.5;
         this.§_-Y1T§.x += 20;
      }
      
      private function §_-Zt§(param1:MouseEvent) : void
      {
         var _loc2_:§_-v1R§ = new §_-v1R§();
         §_-m2d§.save(_loc2_.bitmapData,"golden_cup",false);
         §_-j2O§.place(Game.self,§_-j2O§.WALL_GOLDEN_CUP,_loc2_.id,new Bitmap(_loc2_.bitmapData),_loc2_.caption);
         hide();
      }
   }
}

