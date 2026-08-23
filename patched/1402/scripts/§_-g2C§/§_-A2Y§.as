package §_-g2C§
{
   import §_-61C§.§_-a2p§;
   import §_-HG§.§_-i1N§;
   import §_-HG§.§_-w2L§;
   import §_-X1k§.§_-hO§;
   import §_-X1k§.§_-r12§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-j2E§.§_-92f§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.ui.Keyboard;
   import protocol.§_-n2E§;
   
   public class §_-A2Y§ extends §_-i1N§
   {
      
      private static const §_-u1b§:Number = 35;
      
      private static const §_-l2V§:Number = 10;
      
      private static var _instance:§_-A2Y§;
      
      private var hero:Hero = null;
      
      public function §_-A2Y§()
      {
         super();
         _instance = this;
         §_-hO§.addEventListener(GameEvent.MANA_CHANGED,this.§_-o2X§);
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
         _instance.§_-S1q§();
      }
      
      override public function addButton(param1:§_-w2L§) : void
      {
         param1.x = -int((this.buttons.length + 1) * (§_-u1b§ + §_-l2V§));
         param1.hero = this.hero;
         super.addButton(param1);
      }
      
      override public function get perksAvailable() : Boolean
      {
         return super.perksAvailable && !§_-at§.§_-F2u§.nonClothes;
      }
      
      override public function get perksVisible() : Boolean
      {
         return super.perksVisible && §_-a2p§.hero && (§_-a2p§.hero.isSquirrel || §_-a2p§.hero.isScrat) && !§_-a2p§.hero.shaman && §_-t2c§.active is §_-u24§ && §_-r12§.§_-FS§(§_-n2E§.§_-y1i§);
      }
      
      public function §_-J1b§(param1:Boolean) : void
      {
         var _loc2_:§_-P1O§ = null;
         for each(_loc2_ in this.buttons)
         {
            _loc2_.§_-5n§ = param1;
         }
      }
      
      override protected function get keyCode() : uint
      {
         return Keyboard.T;
      }
      
      private function update() : void
      {
         var abilities:Vector.<§_-92f§>;
         var i:int;
         this.§_-S1q§();
         abilities = this.hero.perkController.perksClothes.slice();
         abilities.sort(function(param1:§_-92f§, param2:§_-92f§):int
         {
            return param1.§_-T2a§ > param2.§_-T2a§ ? 1 : -1;
         });
         abilities.reverse();
         i = 0;
         while(i < abilities.length)
         {
            this.addButton(new §_-P1O§(abilities[i].§_-T2a§));
            i++;
         }
         this.buttons.reverse();
         this.redraw();
      }
      
      private function redraw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.25);
         var _loc1_:int = int(this.buttons.length * (§_-u1b§ + §_-l2V§) + §_-l2V§);
         var _loc2_:Number = this.§_-E1l§.height;
         this.graphics.drawRoundRectComplex(3 - _loc1_,-7,_loc1_ - 1,_loc2_ + 5,10,10,10,10);
         this.graphics.endFill();
      }
      
      private function §_-S1q§() : void
      {
         while(this.buttons.length > 0)
         {
            (this.buttons.pop() as §_-P1O§).dispose();
         }
         if(contains(this.§_-E1l§))
         {
            removeChild(this.§_-E1l§);
         }
         this.§_-E1l§ = new Sprite();
         addChild(this.§_-E1l§);
      }
      
      private function §_-o2X§(param1:GameEvent) : void
      {
         updateButtons();
      }
   }
}

