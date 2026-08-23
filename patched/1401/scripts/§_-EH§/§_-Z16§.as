package §_-EH§
{
   import §_-92M§.§_-Qm§;
   import §_-92M§.§_-X2z§;
   import §_-D2k§.§_-A2q§;
   import §_-S1D§.§_-O1M§;
   import §_-S2§.§_-22A§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-vK§.§_-qC§;
   import flash.display.Sprite;
   import flash.ui.Keyboard;
   
   public class §_-Z16§ extends §_-Qm§
   {
      
      private static const §_-V13§:int = 35;
      
      private static const §_-A2s§:int = 10;
      
      private static const §_-2k§:Number = 10;
      
      private static const §_-7s§:int = 2;
      
      private static var _instance:§_-Z16§ = null;
      
      private var hero:Hero = null;
      
      private var §_-12T§:Number;
      
      private var §_-D2c§:Number;
      
      public function §_-Z16§()
      {
         super();
         _instance = this;
      }
      
      public static function set hero(param1:Hero) : void
      {
         _instance.hero = param1;
         if(_instance.hero != null)
         {
            _instance.update();
            return;
         }
         _instance.§_-81T§();
      }
      
      public static function get visible() : Boolean
      {
         return _instance.visible;
      }
      
      override public function get perksVisible() : Boolean
      {
         return super.perksVisible && §_-O1M§.hero && §_-O1M§.hero.shaman && §_-71o§.active is §_-92z§ && §_-92z§.mode != §_-q1p§.§_-w1Y§ && !(§_-O1M§.hero.game is §_-A2q§);
      }
      
      override public function addButton(param1:§_-X2z§) : void
      {
         param1.y = int(this.buttons.length % §_-7s§) * (§_-V13§ + §_-A2s§);
         param1.x = int(this.buttons.length / §_-7s§) * (§_-V13§ + §_-A2s§);
         param1.hero = this.hero;
         super.addButton(param1);
      }
      
      override public function get width() : Number
      {
         return this.§_-12T§;
      }
      
      override public function get height() : Number
      {
         return this.§_-D2c§;
      }
      
      override protected function get keyCode() : uint
      {
         return Keyboard.T;
      }
      
      private function update() : void
      {
         var _loc2_:§_-qC§ = null;
         var _loc3_:int = 0;
         this.§_-81T§();
         var _loc1_:Array = [];
         for each(_loc2_ in this.hero.perkController.§_-515§)
         {
            if(!(_loc2_ is §_-22A§))
            {
               _loc1_.push(_loc2_.§_-i2D§);
            }
         }
         _loc1_.sort(Array.NUMERIC);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            this.addButton(new §_-M2t§(_loc1_[_loc3_]));
            _loc3_++;
         }
         this.redraw();
      }
      
      private function redraw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.25);
         this.§_-12T§ = (int(this.buttons.length / §_-7s§) + this.buttons.length % §_-7s§) * (§_-V13§ + §_-A2s§) + §_-2k§;
         this.§_-D2c§ = (this.buttons.length < §_-7s§ ? this.buttons.length : §_-7s§) * (§_-V13§ + §_-A2s§) + 2 * §_-2k§ - §_-A2s§;
         this.graphics.drawRoundRectComplex(-§_-2k§,-§_-2k§,this.§_-12T§,this.§_-D2c§,10,10,10,10);
         this.graphics.endFill();
      }
      
      private function §_-81T§() : void
      {
         while(this.buttons.length > 0)
         {
            (this.buttons.pop() as §_-M2t§).dispose();
         }
         if(contains(this.§_-kH§))
         {
            removeChild(this.§_-kH§);
         }
         this.§_-kH§ = new Sprite();
         addChild(this.§_-kH§);
      }
   }
}

