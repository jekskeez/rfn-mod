package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.GameBody;
   import §_-83V§.§_-r1o§;
   import §_-S2§.Perk;
   import §_-u2r§.§_-R1r§;
   import §_-u2r§.§_-q22§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.§_-S2I§;
   
   public class §_-Q2B§ extends §_-H2N§
   {
      
      private static const §_-01b§:Number = 7.5;
      
      private var elements:Array = null;
      
      private var view:MovieClip = null;
      
      public function §_-Q2B§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "push";
         this.§_-mw§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get activeTime() : Number
      {
         return 1.2;
      }
      
      override public function get maxCountUse() : int
      {
         return 1;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.active)
         {
            this.move(param1);
         }
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         this.elements = this.hero.game.map.get(§_-r1o§,true);
         this.elements = this.elements.concat(this.hero.game.map.get(§_-R1r§,true)).concat(this.hero.game.map.get(§_-q22§,true));
         this.view = new MagicElectroPushView();
         this.view.addEventListener(Event.CHANGE,this.§_-Hp§);
         this.hero.§_-72F§(this.view);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         super.§_-o2C§(param1);
         if(!this.hero || param1[1] != this.§_-i2D§ || param1[0] != this.hero.id || param1[2] != §_-S2I§.§_-EY§)
         {
            return;
         }
         this.§_-3V§ = this.totalCooldown;
         dispatchEvent(new Event(Perk.§_-RK§));
      }
      
      private function move(param1:Number) : void
      {
         var _loc2_:GameBody = null;
         var _loc3_:b2Vec2 = null;
         if(!this.hero || this.hero.isDead || this.hero.shaman || this.hero.inHollow)
         {
            this.active = false;
            return;
         }
         for each(_loc2_ in this.elements)
         {
            if(_loc2_.body != null)
            {
               _loc3_ = new b2Vec2(_loc2_.position.x - this.hero.position.x,_loc2_.position.y - this.hero.position.y);
               _loc3_.Multiply(§_-01b§ * param1 / _loc3_.Length());
               _loc3_.Add(_loc2_.position);
               _loc3_.x = Math.max(0,Math.min(_loc3_.x,this.hero.game.map.size.x / Game.§_-x2P§));
               _loc3_.y = Math.max(0,Math.min(_loc3_.y,this.hero.game.map.size.y / Game.§_-x2P§));
               _loc2_.position = _loc3_;
            }
         }
      }
      
      private function §_-Hp§(param1:Event) : void
      {
         if(this.hero)
         {
            this.hero.changeView();
         }
         this.view.removeEventListener(Event.CHANGE,this.§_-Hp§);
         this.view = null;
      }
   }
}

