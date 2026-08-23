package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-h25§;
   
   public class §_-K2e§ extends §_-S2w§
   {
      
      private static const §_-WF§:int = 5;
      
      private static var bonuses:Object = {};
      
      private var §_-kJ§:Sprite = null;
      
      private var §_-F2U§:int;
      
      public function §_-K2e§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-p1d§;
         this.§_-F2U§ = this.hero.id;
      }
      
      private static function §_-N2O§() : int
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc1_:Number = 0;
         for(_loc3_ in bonuses)
         {
            if(bonuses[_loc3_] > _loc1_)
            {
               _loc1_ = Number(bonuses[_loc3_]);
               _loc2_ = int(_loc3_);
            }
         }
         return _loc2_;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§ && !this.hero.game.paused;
      }
      
      override public function dispose() : void
      {
         this.§_-Z2e§();
         super.dispose();
      }
      
      override public function get maxCountUse() : int
      {
         return 2;
      }
      
      override public function get activeTime() : Number
      {
         return §_-bx§();
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.buff)
         {
            this.buff = §_-K5§(0.5);
         }
         this.hero.§_-W1T§(this.buff);
         bonuses[this.§_-F2U§] = §_-bx§();
         if(!this.hero.isSelf || !this.hero.shaman)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"heavensGate":[this.hero.id,this.hero.x,this.hero.y]}));
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.hero)
         {
            this.hero.removeBuff(this.buff);
         }
         delete bonuses[this.§_-F2U§];
         this.§_-Z2e§();
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-1q§,§_-s2l§.§_-v1r§,§_-s2l§.§_-N1Y§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         var _loc3_:§_-h25§ = null;
         var _loc4_:Hero = null;
         var _loc5_:Hero = null;
         if(!this.hero || !this.hero.game || !this.hero.game.squirrels || !this.hero.game.map)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-1q§:
               _loc2_ = param1[1];
               if(!_loc2_)
               {
                  return;
               }
               if(!("heavensGate" in _loc2_))
               {
                  return;
               }
               if(_loc2_["heavensGate"][0] != this.hero.id)
               {
                  return;
               }
               this.§_-kJ§ = new Sprite();
               this.§_-kJ§.x = _loc2_["heavensGate"][1];
               this.§_-kJ§.y = _loc2_["heavensGate"][2];
               this.§_-kJ§.rotation = this.hero.rotation;
               this.hero.game.map.§_-o1i§.addChild(this.§_-kJ§);
               _loc3_ = new §_-h25§(new HeavensGate());
               _loc3_.x = -47;
               _loc3_.y = -55;
               _loc3_.play();
               _loc3_.loop = false;
               this.§_-kJ§.addChild(_loc3_);
               if(!this.§_-53U§)
               {
                  return;
               }
               §_-p1V§.§_-A3z§(this.§_-E1u§);
               break;
            case §_-s2l§.§_-v1r§:
               if(!this.active)
               {
                  return;
               }
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               _loc4_ = this.hero.game.squirrels.get(param1[0]);
               if(!_loc4_ || !_loc4_.isSelf)
               {
                  return;
               }
               setTimeout(Connection.§_-e2T§,100,§_-u1O§.§_-N1Y§,§_-s2l§.§_-m21§);
               break;
            case §_-s2l§.§_-N1Y§:
               if(param1[2] != §_-s2l§.§_-m21§)
               {
                  return;
               }
               if(param1[0] == §_-s2l§.§_-Y2§)
               {
                  return;
               }
               if(!this.active || §_-N2O§() != this.§_-F2U§)
               {
                  return;
               }
               _loc5_ = this.hero.game.squirrels.get(param1[1]);
               if(!_loc5_ || !_loc5_.isDead || _loc5_.§_-Ha§ || _loc5_.§_-92v§ || !this.§_-kJ§)
               {
                  return;
               }
               setTimeout(_loc5_.teleportTo,0,new b2Vec2(this.§_-kJ§.x / Game.§_-12A§,this.§_-kJ§.y / Game.§_-12A§));
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-E1u§() : void
      {
         if(!this.hero || !this.hero.§_-K13§ || this.hero.inHollow)
         {
            return;
         }
         var _loc1_:Point = this.hero.parent.globalToLocal(this.hero.localToGlobal(new Point(this.hero.heroView.direction ? 70 : -70,0))).subtract(new Point(this.§_-kJ§.x,this.§_-kJ§.y));
         if(_loc1_.length < §_-WF§)
         {
            return;
         }
         _loc1_.normalize(_loc1_.length < 3 * §_-WF§ ? _loc1_.length * 0.5 : §_-WF§);
         this.§_-kJ§.x += _loc1_.x;
         this.§_-kJ§.y += _loc1_.y;
         this.§_-kJ§.rotation = this.hero.rotation;
      }
      
      private function §_-Z2e§() : void
      {
         if(Boolean(this.§_-kJ§) && Boolean(this.§_-kJ§.parent))
         {
            this.§_-kJ§.parent.removeChild(this.§_-kJ§);
         }
         §_-p1V§.§_-DO§(this.§_-E1u§);
      }
   }
}

