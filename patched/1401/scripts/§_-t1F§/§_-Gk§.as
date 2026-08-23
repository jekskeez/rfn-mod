package §_-t1F§
{
   import §_-k1c§.Dialog;
   import §_-k2g§.§_-41s§;
   import buttons.§_-j18§;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-73l§;
   import views.§_-3c§;
   
   public class §_-Gk§ extends Dialog
   {
      
      protected var §_-D1H§:§_-j18§ = null;
      
      protected var §_-L1Q§:Sprite = null;
      
      protected var §_-J2g§:Sprite = null;
      
      public function §_-Gk§()
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
         this.§_-L1Q§ = new LeprechaunCap();
         this.§_-L1Q§.x = 180;
         this.§_-L1Q§.y = 120;
         addChild(this.§_-L1Q§);
         this.§_-J2g§ = new §_-3c§();
         this.§_-J2g§.scaleX = this.§_-J2g§.scaleY = 1.3;
         this.§_-J2g§.x = 40;
         this.§_-J2g§.y = 150;
         addChild(this.§_-J2g§);
         place();
         this.height = 450;
         this.§_-D1H§ = new §_-j18§(gls("Рассказать друзьям"),170,14,this.§_-v1N§);
         this.§_-D1H§.x = int((this.width - this.§_-D1H§.width) * 0.5);
         this.§_-D1H§.y = this.height - this.§_-D1H§.height - 10;
         addChild(this.§_-D1H§);
         this.§_-zl§.y = 10;
         this.§_-zl§.setTextFormat(FORMAT_CAPTION_29_CENTER);
         this.§_-zl§.width -= this.§_-O2e§.width * 2;
         this.§_-O2e§.x = this.width - this.§_-O2e§.width * 1.5;
         this.§_-O2e§.y = this.§_-O2e§.height * 0.5;
         this.§_-zl§.x += 20;
      }
      
      private function §_-v1N§(param1:MouseEvent) : void
      {
         var _loc2_:§_-41s§ = new §_-41s§();
         §_-E1s§.save(_loc2_.bitmapData,"golden_cup",false);
         §_-73l§.place(Game.self,§_-73l§.WALL_GOLDEN_CUP,_loc2_.id,new Bitmap(_loc2_.bitmapData),_loc2_.caption);
         hide();
      }
   }
}

