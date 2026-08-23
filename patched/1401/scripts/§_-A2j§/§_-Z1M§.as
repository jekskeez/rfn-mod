package §_-A2j§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-d10§.§_-s2E§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import utils.§_-jB§;
   import views.§_-fa§;
   
   public class §_-Z1M§ extends §_-q2§
   {
      
      protected var §_-Xk§:§_-fa§ = null;
      
      protected var §_-W2C§:Sprite = null;
      
      protected var §_-21J§:§_-s2E§ = null;
      
      public function §_-Z1M§(param1:int)
      {
         super(param1);
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
      }
      
      override public function §_-027§() : void
      {
         if(this.§_-Xk§)
         {
            return;
         }
         this.§_-Xk§ = new §_-fa§(this.id);
         this.§_-Xk§.x = 20;
         this.§_-Xk§.y = 35;
         addChild(this.§_-Xk§);
      }
      
      override protected function get backWidth() : int
      {
         return 110;
      }
      
      override protected function get backHeight() : int
      {
         return 115;
      }
      
      override protected function §_-Cr§() : void
      {
         super.§_-Cr§();
         this.§_-T1j§.y -= 7;
         this.§_-W2C§ = new Sprite();
         addChild(this.§_-W2C§);
         var _loc1_:§_-22V§ = new §_-22V§(this.cost + " -",0,this.backHeight - 25,new TextFormat(§_-22V§.§_-F2z§,14,9197366,true));
         _loc1_.x = (this.width - _loc1_.width - 8) * 0.5;
         this.§_-W2C§.addChild(_loc1_);
         §_-jB§.§_-fG§(_loc1_,"-",ImageIconCoins,0.55,0.55,-_loc1_.x,-_loc1_.y - 1,false,false);
         this.§_-21J§ = new §_-s2E§(§_-s2E§.§_-jI§);
         this.§_-21J§.x = 12;
         this.§_-21J§.y = 100;
         this.§_-21J§.scaleX = this.§_-21J§.scaleY = 0.8;
         addChild(this.§_-21J§);
         this.update();
      }
      
      override protected function get titleFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-F2z§,12,6697728,true,null,null,null,null,"center");
      }
      
      override protected function get isBought() : Boolean
      {
         return §_-h1f§.§_-s2p§.indexOf(this.id) != -1;
      }
      
      override protected function get title() : String
      {
         return §_-g2W§.§_-224§(this.id);
      }
      
      override protected function get cost() : int
      {
         return §_-g2W§.§_-q1s§(this.id);
      }
      
      private function update(param1:GameEvent = null) : void
      {
         this.§_-21J§.visible = §_-h1f§.§_-s2p§.indexOf(this.id) != -1;
         this.§_-W2C§.visible = §_-h1f§.§_-s2p§.indexOf(this.id) == -1;
      }
   }
}

