package §_-j1y§
{
   import §_-61C§.§_-a2p§;
   import §_-HG§.§_-i1N§;
   import §_-HG§.§_-w2L§;
   import §_-M1h§.§_-Vk§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-n1h§.§_-xV§;
   import §_-o10§.§_-p1B§;
   import flash.display.Sprite;
   import flash.ui.Keyboard;
   
   public class §_-Y3§ extends §_-i1N§
   {
      
      private static const §_-u1b§:int = 35;
      
      private static const §_-l2V§:int = 10;
      
      private static const §_-Y1n§:Number = 10;
      
      private static const §_-X24§:int = 2;
      
      private static var _instance:§_-Y3§ = null;
      
      private var hero:Hero = null;
      
      private var §_-Jr§:Number;
      
      private var §_-33u§:Number;
      
      public function §_-Y3§()
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
         _instance.§_-S1q§();
      }
      
      public static function get visible() : Boolean
      {
         return _instance.visible;
      }
      
      override public function get perksVisible() : Boolean
      {
         return super.perksVisible && §_-a2p§.hero && §_-a2p§.hero.shaman && §_-t2c§.active is §_-u24§ && §_-u24§.mode != §_-at§.§_-F15§ && !(§_-a2p§.hero.game is §_-Vk§);
      }
      
      override public function addButton(param1:§_-w2L§) : void
      {
         param1.y = int(this.buttons.length % §_-X24§) * (§_-u1b§ + §_-l2V§);
         param1.x = int(this.buttons.length / §_-X24§) * (§_-u1b§ + §_-l2V§);
         param1.hero = this.hero;
         super.addButton(param1);
      }
      
      override public function get width() : Number
      {
         return this.§_-Jr§;
      }
      
      override public function get height() : Number
      {
         return this.§_-33u§;
      }
      
      override protected function get keyCode() : uint
      {
         return Keyboard.T;
      }
      
      private function update() : void
      {
         var _loc2_:§_-p1B§ = null;
         var _loc3_:int = 0;
         this.§_-S1q§();
         var _loc1_:Array = [];
         for each(_loc2_ in this.hero.perkController.§_-ov§)
         {
            if(!(_loc2_ is §_-xV§))
            {
               _loc1_.push(_loc2_.§_-T2a§);
            }
         }
         _loc1_.sort(Array.NUMERIC);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            this.addButton(new §_-13p§(_loc1_[_loc3_]));
            _loc3_++;
         }
         this.redraw();
      }
      
      private function redraw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.25);
         this.§_-Jr§ = (int(this.buttons.length / §_-X24§) + this.buttons.length % §_-X24§) * (§_-u1b§ + §_-l2V§) + §_-Y1n§;
         this.§_-33u§ = (this.buttons.length < §_-X24§ ? this.buttons.length : §_-X24§) * (§_-u1b§ + §_-l2V§) + 2 * §_-Y1n§ - §_-l2V§;
         this.graphics.drawRoundRectComplex(-§_-Y1n§,-§_-Y1n§,this.§_-Jr§,this.§_-33u§,10,10,10,10);
         this.graphics.endFill();
      }
      
      private function §_-S1q§() : void
      {
         while(this.buttons.length > 0)
         {
            (this.buttons.pop() as §_-13p§).dispose();
         }
         if(contains(this.§_-E1l§))
         {
            removeChild(this.§_-E1l§);
         }
         this.§_-E1l§ = new Sprite();
         addChild(this.§_-E1l§);
      }
   }
}

