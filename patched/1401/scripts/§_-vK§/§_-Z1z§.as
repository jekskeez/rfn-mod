package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-i2C§;
   
   public class §_-Z1z§ extends §_-21O§
   {
      
      private static const §_-zB§:int = 5;
      
      private static var bonuses:Object = {};
      
      private var §_-F2H§:Sprite = null;
      
      private var §_-K1v§:int;
      
      public function §_-Z1z§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-u1I§;
         this.§_-K1v§ = this.hero.id;
      }
      
      private static function §_-xz§() : int
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
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-k2P§ && !this.hero.game.paused;
      }
      
      override public function dispose() : void
      {
         this.§_-2y§();
         super.dispose();
      }
      
      override public function get maxCountUse() : int
      {
         return 2;
      }
      
      override public function get activeTime() : Number
      {
         return §_-Nu§();
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
            this.buff = §_-T1G§(0.5);
         }
         this.hero.§_-Aj§(this.buff);
         bonuses[this.§_-K1v§] = §_-Nu§();
         if(!this.hero.isSelf || !this.hero.shaman)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"heavensGate":[this.hero.id,this.hero.x,this.hero.y]}));
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.hero)
         {
            this.hero.removeBuff(this.buff);
         }
         delete bonuses[this.§_-K1v§];
         this.§_-2y§();
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-b1y§,§_-S2I§.§_-F2m§,§_-S2I§.§_-03G§]);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = null;
         var _loc3_:§_-i2C§ = null;
         var _loc4_:Hero = null;
         var _loc5_:Hero = null;
         if(!this.hero || !this.hero.game || !this.hero.game.squirrels || !this.hero.game.map)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-b1y§:
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
               this.§_-F2H§ = new Sprite();
               this.§_-F2H§.x = _loc2_["heavensGate"][1];
               this.§_-F2H§.y = _loc2_["heavensGate"][2];
               this.§_-F2H§.rotation = this.hero.rotation;
               this.hero.game.map.§_-X1H§.addChild(this.§_-F2H§);
               _loc3_ = new §_-i2C§(new HeavensGate());
               _loc3_.x = -47;
               _loc3_.y = -55;
               _loc3_.play();
               _loc3_.loop = false;
               this.§_-F2H§.addChild(_loc3_);
               if(!this.§_-41W§)
               {
                  return;
               }
               §_-01Y§.§_-h1R§(this.§_-B2s§);
               break;
            case §_-S2I§.§_-F2m§:
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
               setTimeout(Connection.§_-Li§,100,§_-h2B§.§_-03G§,§_-S2I§.§_-y1n§);
               break;
            case §_-S2I§.§_-03G§:
               if(param1[2] != §_-S2I§.§_-y1n§)
               {
                  return;
               }
               if(param1[0] == §_-S2I§.§_-8n§)
               {
                  return;
               }
               if(!this.active || §_-xz§() != this.§_-K1v§)
               {
                  return;
               }
               _loc5_ = this.hero.game.squirrels.get(param1[1]);
               if(!_loc5_ || !_loc5_.isDead || _loc5_.§_-la§ || _loc5_.§_-e1X§ || !this.§_-F2H§)
               {
                  return;
               }
               setTimeout(_loc5_.teleportTo,0,new b2Vec2(this.§_-F2H§.x / Game.§_-x2P§,this.§_-F2H§.y / Game.§_-x2P§));
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-B2s§() : void
      {
         if(!this.hero || !this.hero.§_-k2W§ || this.hero.inHollow)
         {
            return;
         }
         var _loc1_:Point = this.hero.parent.globalToLocal(this.hero.localToGlobal(new Point(this.hero.heroView.direction ? 70 : -70,0))).subtract(new Point(this.§_-F2H§.x,this.§_-F2H§.y));
         if(_loc1_.length < §_-zB§)
         {
            return;
         }
         _loc1_.normalize(_loc1_.length < 3 * §_-zB§ ? _loc1_.length * 0.5 : §_-zB§);
         this.§_-F2H§.x += _loc1_.x;
         this.§_-F2H§.y += _loc1_.y;
         this.§_-F2H§.rotation = this.hero.rotation;
      }
      
      private function §_-2y§() : void
      {
         if(Boolean(this.§_-F2H§) && Boolean(this.§_-F2H§.parent))
         {
            this.§_-F2H§.parent.removeChild(this.§_-F2H§);
         }
         §_-01Y§.§_-t1s§(this.§_-B2s§);
      }
   }
}

