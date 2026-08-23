package §_-q24§
{
   import §_-Qy§.§_-RT§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import utils.§_-K1Y§;
   import views.§_-332§;
   
   public class §_-R2q§ extends §_-F2c§
   {
      
      protected var §_-jz§:§_-332§ = null;
      
      protected var §_-f1m§:Sprite = null;
      
      protected var §_-q1l§:§_-RT§ = null;
      
      public function §_-R2q§(param1:int)
      {
         super(param1);
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
      }
      
      override public function §_-O1s§() : void
      {
         if(this.§_-jz§)
         {
            return;
         }
         this.§_-jz§ = new §_-332§(this.id);
         this.§_-jz§.x = 20;
         this.§_-jz§.y = 35;
         addChild(this.§_-jz§);
      }
      
      override protected function get backWidth() : int
      {
         return 110;
      }
      
      override protected function get backHeight() : int
      {
         return 115;
      }
      
      override protected function §_-5N§() : void
      {
         super.§_-5N§();
         this.§_-Q1w§.y -= 7;
         this.§_-f1m§ = new Sprite();
         addChild(this.§_-f1m§);
         var _loc1_:§_-i5§ = new §_-i5§(this.cost + " -",0,this.backHeight - 25,new TextFormat(§_-i5§.§_-c10§,14,9197366,true));
         _loc1_.x = (this.width - _loc1_.width - 8) * 0.5;
         this.§_-f1m§.addChild(_loc1_);
         §_-K1Y§.§_-P2W§(_loc1_,"-",ImageIconCoins,0.55,0.55,-_loc1_.x,-_loc1_.y - 1,false,false);
         this.§_-q1l§ = new §_-RT§(§_-RT§.§_-ZS§);
         this.§_-q1l§.x = 12;
         this.§_-q1l§.y = 100;
         this.§_-q1l§.scaleX = this.§_-q1l§.scaleY = 0.8;
         addChild(this.§_-q1l§);
         this.update();
      }
      
      override protected function get titleFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-c10§,12,6697728,true,null,null,null,null,"center");
      }
      
      override protected function get isBought() : Boolean
      {
         return §_-L1o§.§_-Ki§.indexOf(this.id) != -1;
      }
      
      override protected function get title() : String
      {
         return §_-P2x§.§_-d1E§(this.id);
      }
      
      override protected function get cost() : int
      {
         return §_-P2x§.§_-q2t§(this.id);
      }
      
      private function update(param1:GameEvent = null) : void
      {
         this.§_-q1l§.visible = §_-L1o§.§_-Ki§.indexOf(this.id) != -1;
         this.§_-f1m§.visible = §_-L1o§.§_-Ki§.indexOf(this.id) == -1;
      }
   }
}

