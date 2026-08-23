package starling.core
{
   import §_-K2c§.Event;
   import §_-K2c§.§_-zT§;
   import §_-sk§.BitmapFont;
   import §_-sk§.TextField;
   import flash.system.System;
   import starling.display.BlendMode;
   import starling.display.Sprite;
   import starling.display.§_-u16§;
   import starling.utils.§_-G8§;
   import starling.utils.§_-Y1C§;
   
   internal class §_-Q1Z§ extends Sprite
   {
      
      private const §_-o19§:Number = 0.5;
      
      private var §_-e1R§:§_-u16§;
      
      private var §_-n1Y§:TextField;
      
      private var §_-rp§:int = 0;
      
      private var §_-GP§:Number = 0;
      
      private var §_-v2N§:Number = 0;
      
      private var §_-Z1p§:Number = 0;
      
      private var §_-w2K§:int = 0;
      
      public function §_-Q1Z§()
      {
         super();
         this.§_-e1R§ = new §_-u16§(50,25,0);
         this.§_-n1Y§ = new TextField(48,25,"",BitmapFont.§_-Q1Y§,BitmapFont.§_-K23§,16777215);
         this.§_-n1Y§.x = 2;
         this.§_-n1Y§.hAlign = §_-G8§.LEFT;
         this.§_-n1Y§.vAlign = §_-Y1C§.TOP;
         addChild(this.§_-e1R§);
         addChild(this.§_-n1Y§);
         blendMode = BlendMode.NONE;
         addEventListener(Event.ADDED_TO_STAGE,this.§_-wm§);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-h2j§);
      }
      
      private function §_-wm§() : void
      {
         addEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
         this.§_-GP§ = this.§_-rp§ = 0;
         this.update();
      }
      
      private function §_-h2j§() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
      }
      
      private function §_-L1Y§(param1:§_-zT§) : void
      {
         this.§_-GP§ += param1.§_-g1p§;
         ++this.§_-rp§;
         if(this.§_-GP§ > 0.5)
         {
            this.update();
            this.§_-rp§ = this.§_-GP§ = 0;
         }
      }
      
      public function update() : void
      {
         this.§_-v2N§ = this.§_-GP§ > 0 ? this.§_-rp§ / this.§_-GP§ : 0;
         this.§_-Z1p§ = System.totalMemory * 9.54e-7;
         this.§_-n1Y§.text = "FPS: " + this.§_-v2N§.toFixed(this.§_-v2N§ < 100 ? 1 : 0) + "\nMEM: " + this.§_-Z1p§.toFixed(this.§_-Z1p§ < 100 ? 1 : 0) + "\nDRW: " + (this.§_-GP§ > 0 ? this.§_-w2K§ - 2 : this.§_-w2K§);
      }
      
      override public function render(param1:§_-T2v§, param2:Number) : void
      {
         param1.§_-A1U§();
         super.render(param1,param2);
      }
      
      public function get §_-y2B§() : int
      {
         return this.§_-w2K§;
      }
      
      public function set §_-y2B§(param1:int) : void
      {
         this.§_-w2K§ = param1;
      }
      
      public function get §_-R2s§() : Number
      {
         return this.§_-v2N§;
      }
      
      public function set §_-R2s§(param1:Number) : void
      {
         this.§_-v2N§ = param1;
      }
      
      public function get §_-h2§() : Number
      {
         return this.§_-Z1p§;
      }
      
      public function set §_-h2§(param1:Number) : void
      {
         this.§_-Z1p§ = param1;
      }
   }
}

