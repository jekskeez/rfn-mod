package starling.core
{
   import §_-b5§.BitmapFont;
   import §_-b5§.TextField;
   import §_-f1T§.Event;
   import §_-f1T§.§_-K1M§;
   import flash.system.System;
   import starling.display.BlendMode;
   import starling.display.Sprite;
   import starling.display.§_-V2h§;
   import starling.utils.§_-42b§;
   import starling.utils.§_-U2x§;
   
   internal class §_-N1Q§ extends Sprite
   {
      
      private const §_-W4§:Number = 0.5;
      
      private var §_-Zx§:§_-V2h§;
      
      private var §_-g2D§:TextField;
      
      private var §_-Av§:int = 0;
      
      private var §_-SV§:Number = 0;
      
      private var §_-kP§:Number = 0;
      
      private var §_-H2U§:Number = 0;
      
      private var §_-e1Z§:int = 0;
      
      public function §_-N1Q§()
      {
         super();
         this.§_-Zx§ = new §_-V2h§(50,25,0);
         this.§_-g2D§ = new TextField(48,25,"",BitmapFont.§_-M23§,BitmapFont.§_-Qf§,16777215);
         this.§_-g2D§.x = 2;
         this.§_-g2D§.hAlign = §_-U2x§.LEFT;
         this.§_-g2D§.vAlign = §_-42b§.TOP;
         addChild(this.§_-Zx§);
         addChild(this.§_-g2D§);
         blendMode = BlendMode.NONE;
         addEventListener(Event.ADDED_TO_STAGE,this.§_-F10§);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-D1y§);
      }
      
      private function §_-F10§() : void
      {
         addEventListener(Event.ENTER_FRAME,this.§_-A1X§);
         this.§_-SV§ = this.§_-Av§ = 0;
         this.update();
      }
      
      private function §_-D1y§() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.§_-A1X§);
      }
      
      private function §_-A1X§(param1:§_-K1M§) : void
      {
         this.§_-SV§ += param1.§_-ID§;
         ++this.§_-Av§;
         if(this.§_-SV§ > 0.5)
         {
            this.update();
            this.§_-Av§ = this.§_-SV§ = 0;
         }
      }
      
      public function update() : void
      {
         this.§_-kP§ = this.§_-SV§ > 0 ? this.§_-Av§ / this.§_-SV§ : 0;
         this.§_-H2U§ = System.totalMemory * 9.54e-7;
         this.§_-g2D§.text = "FPS: " + this.§_-kP§.toFixed(this.§_-kP§ < 100 ? 1 : 0) + "\nMEM: " + this.§_-H2U§.toFixed(this.§_-H2U§ < 100 ? 1 : 0) + "\nDRW: " + (this.§_-SV§ > 0 ? this.§_-e1Z§ - 2 : this.§_-e1Z§);
      }
      
      override public function render(param1:§_-wz§, param2:Number) : void
      {
         param1.§_-z24§();
         super.render(param1,param2);
      }
      
      public function get §_-t1V§() : int
      {
         return this.§_-e1Z§;
      }
      
      public function set §_-t1V§(param1:int) : void
      {
         this.§_-e1Z§ = param1;
      }
      
      public function get §_-T8§() : Number
      {
         return this.§_-kP§;
      }
      
      public function set §_-T8§(param1:Number) : void
      {
         this.§_-kP§ = param1;
      }
      
      public function get §_-j1A§() : Number
      {
         return this.§_-H2U§;
      }
      
      public function set §_-j1A§(param1:Number) : void
      {
         this.§_-H2U§ = param1;
      }
   }
}

