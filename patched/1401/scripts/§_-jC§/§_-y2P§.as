package §_-jC§
{
   import §_-92M§.§_-Qm§;
   import §_-92M§.§_-X2z§;
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-Z1F§;
   import §_-P2b§.§_-H2N§;
   import §_-S1D§.§_-O1M§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.ui.Keyboard;
   import protocol.§_-T2o§;
   
   public class §_-y2P§ extends §_-Qm§
   {
      
      private static const §_-V13§:Number = 35;
      
      private static const §_-A2s§:Number = 10;
      
      private static var _instance:§_-y2P§;
      
      private var hero:Hero = null;
      
      public function §_-y2P§()
      {
         super();
         _instance = this;
         §_-Z1F§.addEventListener(GameEvent.MANA_CHANGED,this.§_-sG§);
      }
      
      public static function get visible() : Boolean
      {
         return _instance.visible;
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
      
      override public function addButton(param1:§_-X2z§) : void
      {
         param1.x = -int((this.buttons.length + 1) * (§_-V13§ + §_-A2s§));
         param1.hero = this.hero;
         super.addButton(param1);
      }
      
      override public function get perksAvailable() : Boolean
      {
         return super.perksAvailable && !§_-q1p§.§_-Vz§.nonClothes;
      }
      
      override public function get perksVisible() : Boolean
      {
         return super.perksVisible && §_-O1M§.hero && (§_-O1M§.hero.isSquirrel || §_-O1M§.hero.isScrat) && !§_-O1M§.hero.shaman && §_-71o§.active is §_-92z§ && §_-Bm§.§_-2S§(§_-T2o§.§_-Q2R§);
      }
      
      public function §_-m20§(param1:Boolean) : void
      {
         var _loc2_:§_-a11§ = null;
         for each(_loc2_ in this.buttons)
         {
            _loc2_.§_-IR§ = param1;
         }
      }
      
      override protected function get keyCode() : uint
      {
         return Keyboard.T;
      }
      
      private function update() : void
      {
         var abilities:Vector.<§_-H2N§>;
         var i:int;
         this.§_-81T§();
         abilities = this.hero.perkController.perksClothes.slice();
         abilities.sort(function(param1:§_-H2N§, param2:§_-H2N§):int
         {
            return param1.§_-i2D§ > param2.§_-i2D§ ? 1 : -1;
         });
         abilities.reverse();
         i = 0;
         while(i < abilities.length)
         {
            this.addButton(new §_-a11§(abilities[i].§_-i2D§));
            i++;
         }
         this.buttons.reverse();
         this.redraw();
      }
      
      private function redraw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.25);
         var _loc1_:int = int(this.buttons.length * (§_-V13§ + §_-A2s§) + §_-A2s§);
         var _loc2_:Number = this.§_-kH§.height;
         this.graphics.drawRoundRectComplex(3 - _loc1_,-7,_loc1_ - 1,_loc2_ + 5,10,10,10,10);
         this.graphics.endFill();
      }
      
      private function §_-81T§() : void
      {
         while(this.buttons.length > 0)
         {
            (this.buttons.pop() as §_-a11§).dispose();
         }
         if(contains(this.§_-kH§))
         {
            removeChild(this.§_-kH§);
         }
         this.§_-kH§ = new Sprite();
         addChild(this.§_-kH§);
      }
      
      private function §_-sG§(param1:GameEvent) : void
      {
         updateButtons();
      }
   }
}

