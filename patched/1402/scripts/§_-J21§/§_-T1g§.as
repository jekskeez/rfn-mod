package §_-J21§
{
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-j2E§.§_-A11§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import tape.§_-2n§;
   
   public class §_-T1g§ extends §_-2n§
   {
      
      private var icon:DisplayObject = null;
      
      private var §_-Q2I§:DisplayObject = null;
      
      public function §_-T1g§(param1:int)
      {
         super(param1);
      }
      
      public function set active(param1:Boolean) : void
      {
         if(param1 && !this.§_-Q2I§)
         {
            this.§_-Q2I§ = new PerkExtraCurrentFrame();
         }
         if(this.§_-Q2I§)
         {
            this.§_-Q2I§.visible = param1;
            if(param1)
            {
               this.§_-Oh§.visible = false;
            }
            this.§_-Q2I§.x = -10;
            this.§_-Q2I§.y = -8;
            addChild(this.§_-Q2I§);
         }
      }
      
      public function §_-61d§() : void
      {
         if(this.icon)
         {
            removeChild(this.icon);
         }
         this.icon = null;
         var _loc1_:int = §_-P2x§.§_-c1K§(this.id);
         var _loc2_:int = §_-P2x§.§_-93Q§(_loc1_);
         if(!§_-L1o§.§_-J2p§(_loc1_,§_-L1o§.§_-U1v§) || !§_-L1o§.§_-J2p§(_loc2_,§_-L1o§.§_-U1v§))
         {
            this.icon = new ImageIconCoins();
            this.icon.scaleX = this.icon.scaleY = 0.8;
         }
         else if(§_-L1o§.§_-Tg§(_loc2_) != 0)
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
         var _loc1_:DisplayObject = §_-A11§.§_-51T§(this.id);
         _loc1_.x = _loc1_.y = 20;
         addChild(_loc1_);
         this.§_-61d§();
         this.back = new MovieClip();
         addChild(this.back);
         this.§_-Oh§ = new PerkExtraSelectedFrame();
         this.§_-Oh§.x -= 10;
         this.§_-Oh§.y -= 8;
         this.§_-Oh§.visible = false;
         addChild(this.§_-Oh§);
      }
   }
}

