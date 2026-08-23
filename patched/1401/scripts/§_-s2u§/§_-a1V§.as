package §_-s2u§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-P2b§.§_-6L§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import tape.§_-A3s§;
   
   public class §_-a1V§ extends §_-A3s§
   {
      
      private var icon:DisplayObject = null;
      
      private var §_-R3§:DisplayObject = null;
      
      public function §_-a1V§(param1:int)
      {
         super(param1);
      }
      
      public function set active(param1:Boolean) : void
      {
         if(param1 && !this.§_-R3§)
         {
            this.§_-R3§ = new PerkExtraCurrentFrame();
         }
         if(this.§_-R3§)
         {
            this.§_-R3§.visible = param1;
            if(param1)
            {
               this.§_-Nh§.visible = false;
            }
            this.§_-R3§.x = -10;
            this.§_-R3§.y = -8;
            addChild(this.§_-R3§);
         }
      }
      
      public function §_-yu§() : void
      {
         if(this.icon)
         {
            removeChild(this.icon);
         }
         this.icon = null;
         var _loc1_:int = §_-g2W§.§_-N2b§(this.id);
         var _loc2_:int = §_-g2W§.§_-s1h§(_loc1_);
         if(!§_-h1f§.§_-i21§(_loc1_,§_-h1f§.§_-A3r§) || !§_-h1f§.§_-i21§(_loc2_,§_-h1f§.§_-A3r§))
         {
            this.icon = new ImageIconCoins();
            this.icon.scaleX = this.icon.scaleY = 0.8;
         }
         else if(§_-h1f§.§_-y2U§(_loc2_) != 0)
         {
            this.icon = new ImageIconTime();
         }
         if(this.icon)
         {
            this.icon.x = this.icon.y = 25;
            addChild(this.icon);
         }
      }
      
      override protected function init() : void
      {
         super.init();
         var _loc1_:DisplayObject = §_-6L§.§_-Gi§(this.id);
         _loc1_.x = _loc1_.y = 20;
         addChild(_loc1_);
         this.§_-yu§();
         this.back = new MovieClip();
         addChild(this.back);
         this.§_-Nh§ = new PerkExtraSelectedFrame();
         this.§_-Nh§.x -= 10;
         this.§_-Nh§.y -= 8;
         this.§_-Nh§.visible = false;
         addChild(this.§_-Nh§);
      }
   }
}

