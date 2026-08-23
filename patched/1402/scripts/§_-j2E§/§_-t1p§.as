package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import §_-8Q§.§_-r2M§;
   import §_-I1q§.§_-430§;
   import §_-I1q§.§_-Z2G§;
   import §_-n1h§.Perk;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.§_-s2l§;
   
   public class §_-t1p§ extends §_-92f§
   {
      
      private static const §_-Bs§:Number = 7.5;
      
      private var elements:Array = null;
      
      private var view:MovieClip = null;
      
      public function §_-t1p§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "pull";
         this.§_-i1J§ = true;
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
         this.elements = this.hero.game.map.get(§_-r2M§,true);
         this.elements = this.elements.concat(this.hero.game.map.get(§_-Z2G§,true)).concat(this.hero.game.map.get(§_-430§,true));
         this.view = new MagicElectroPullView();
         this.view.addEventListener(Event.CHANGE,this.§_-w1T§);
         this.hero.§_-s28§(this.view);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         super.§_-x2f§(param1);
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(!this.hero || param1[1] != this.§_-T2a§ || param1[0] != this.hero.id || param1[2] != §_-s2l§.§_-x2Y§)
               {
                  return;
               }
               this.§_-G27§ = this.totalCooldown;
               dispatchEvent(new Event(Perk.§_-E1b§));
         }
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
               _loc3_ = new b2Vec2(this.hero.position.x - _loc2_.position.x,this.hero.position.y - _loc2_.position.y);
               if(_loc3_.Length() > §_-Bs§ * param1)
               {
                  _loc3_.Multiply(§_-Bs§ * param1 / _loc3_.Length());
               }
               _loc3_.Add(_loc2_.position);
               _loc2_.position = _loc3_;
            }
         }
      }
      
      private function §_-w1T§(param1:Event) : void
      {
         if(this.hero)
         {
            this.hero.changeView();
         }
         this.view.removeEventListener(Event.CHANGE,this.§_-w1T§);
         this.view = null;
      }
   }
}

