package §_-A2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A2x§.GameMapNet;
   import §_-F19§.§_-p2§;
   import §_-T2y§.§_-92z§;
   import flash.display.DisplayObject;
   import flash.text.TextFormat;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-e1T§
   {
      
      private static const SIZE:int = 2;
      
      private static const §_-A3O§:int = 16;
      
      private static const §_-n2Q§:int = 4;
      
      private static const §_-a1N§:int = 10;
      
      private static const §_-6K§:int = 15;
      
      private static const NONE:int = -1;
      
      private static const §_-l1B§:int = 0;
      
      private static const §_-l1L§:int = 1;
      
      private static const §_-r1y§:int = 2;
      
      private static const §_-QX§:int = 3;
      
      private static const §_-RJ§:int = 4;
      
      private static const §_-A1r§:int = 5;
      
      private static const §_-b2S§:int = 6;
      
      private static const §_-A2§:int = 7;
      
      private static const §_-K1c§:int = 8;
      
      private static const §_-z14§:int = 9;
      
      private static const §_-yE§:int = 10;
      
      private static const §_-2v§:int = 11;
      
      private static const §_-PJ§:int = 12;
      
      private static const §_-d1d§:int = 13;
      
      private static const §_-y2Q§:Number = 10;
      
      private static const §_-50§:Number = 10;
      
      private static const §_-MS§:int = 8;
      
      private static const §_-75§:int = 5;
      
      private static const §_-i2Z§:int = 3;
      
      private static const §_-71g§:int = 5;
      
      private static const §_-V28§:Array = [60,60,90,160,80,90];
      
      private var id:int = -1;
      
      private var §_-VR§:Number = 0;
      
      private var §_-GZ§:int = -1;
      
      private var §_-832§:Number = 0;
      
      private var §_-mG§:Vector.<§_-kV§>;
      
      private var §_-io§:Object = {};
      
      private var §_-Q2g§:QuestTimerBack = new QuestTimerBack();
      
      private var §_-V2o§:DisplayObject;
      
      private var §_-o2E§:§_-22V§ = null;
      
      public function §_-e1T§(param1:int)
      {
         super();
         this.id = param1;
         this.§_-Q2g§.y = -70;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§,§_-S2I§.§_-W1O§,§_-S2I§.§_-s27§,§_-S2I§.§_-Vs§,§_-S2I§.§_-F2m§]);
      }
      
      public static function get §_-S27§() : Boolean
      {
         switch(§_-R1c§.§_-D1D§)
         {
            case §_-QX§:
            case §_-A1r§:
               return true;
            default:
               return false;
         }
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:§_-kV§ = null;
         var _loc5_:Hero = null;
         if(!SquirrelGame.instance || !SquirrelCollection.instance)
         {
            return;
         }
         switch(this.id)
         {
            case NONE:
               return;
            case §_-l1B§:
               _loc2_ = SquirrelCollection.instance.get(this.§_-h1u§);
               if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || !Hero.self || Hero.self.isDead || Hero.self.inHollow)
               {
                  break;
               }
               _loc3_ = Hero.self.position.Copy();
               _loc3_.Subtract(_loc2_.position);
               if(_loc3_.Length() > §_-A3O§)
               {
                  this.§_-un§ -= param1;
               }
               break;
            case §_-l1L§:
               this.§_-un§ -= param1;
               break;
            case §_-A2§:
               this.§_-832§ -= param1;
               if(this.§_-832§ > 0)
               {
                  return;
               }
               this.§_-832§ = §_-a1N§ + Math.random() * (§_-6K§ - §_-a1N§);
               Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"questFactor":-1}));
               break;
            case §_-yE§:
               if(!Hero.self || Hero.self.shaman || Hero.self.isDead)
               {
                  break;
               }
               for each(_loc2_ in SquirrelCollection.instance.§_-K14§())
               {
                  _loc3_ = Hero.self.position.Copy();
                  _loc3_.Subtract(_loc2_.position);
                  if(_loc3_.Length() <= §_-n2Q§)
                  {
                     this.§_-un§ -= param1;
                  }
               }
               break;
            case §_-d1d§:
               for each(_loc4_ in this.§_-mG§)
               {
                  this.§_-io§[(_loc4_ as §_-q1h§).§_-R1U§] = _loc4_.activated;
               }
         }
         if(Boolean(this.§_-o2E§) && this.§_-un§ <= 0)
         {
            this.§_-Q2g§.removeChild(this.§_-o2E§);
            this.§_-o2E§ = null;
            if(this.§_-Q2g§.parent)
            {
               this.§_-Q2g§.parent.removeChild(this.§_-Q2g§);
            }
         }
         if(this.§_-o2E§)
         {
            this.§_-o2E§.text = this.§_-un§.toFixed(1);
            this.§_-o2E§.x = -int(this.§_-o2E§.textWidth * 0.5) - 3;
            if(Boolean(SquirrelGame.instance) && Boolean(SquirrelCollection.instance) && Boolean(Hero.self))
            {
               this.§_-Q2g§.scaleX = Hero.self.scale > 0 ? 1 : -1;
               this.§_-Q2g§.y = SquirrelCollection.instance.§_-g14§ ? -100 : -70;
               this.§_-Q2g§.visible = Hero.§_-6g§;
            }
         }
         if(this.§_-V2o§)
         {
            _loc5_ = SquirrelCollection.instance.get(this.§_-h1u§);
            this.§_-V2o§.visible = Boolean(_loc5_) && !_loc5_.isDead && !_loc5_.inHollow;
         }
      }
      
      public function dispose() : void
      {
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§,§_-S2I§.§_-W1O§,§_-S2I§.§_-s27§,§_-S2I§.§_-Vs§,§_-S2I§.§_-F2m§]);
      }
      
      private function §_-62g§() : void
      {
         var _loc3_:§_-kV§ = null;
         var _loc1_:int = 1;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-mG§)
         {
            if(_loc3_.activated)
            {
               _loc2_++;
            }
         }
         switch(this.id)
         {
            case §_-l1B§:
            case §_-l1L§:
            case §_-yE§:
               if(this.§_-un§ < 0)
               {
                  return;
               }
               break;
            case §_-r1y§:
               if(!(SquirrelCollection.instance is §_-p2§))
               {
                  return;
               }
               if((SquirrelCollection.instance as §_-p2§).§_-12z§.length != 0)
               {
                  return;
               }
               break;
            case §_-2v§:
               if(this.§_-h1u§ == -1)
               {
                  return;
               }
               break;
            case §_-RJ§:
               if(_loc2_ < §_-i2Z§)
               {
                  return;
               }
               break;
            case §_-K1c§:
               if((this.§_-mG§[0] as §_-tt§).count == 0)
               {
                  return;
               }
               _loc1_ = (this.§_-mG§[0] as §_-tt§).count;
               break;
            case §_-A1r§:
            case §_-z14§:
            case §_-PJ§:
               if(_loc2_ == 0)
               {
                  return;
               }
               break;
            case §_-QX§:
            case §_-b2S§:
               if(_loc2_ == 0)
               {
                  return;
               }
               _loc1_ = _loc2_;
               break;
            case §_-d1d§:
               if(_loc2_ == 0)
               {
                  return;
               }
               _loc1_ = _loc2_;
         }
         §_-R1c§.§_-32q§(this.id,_loc1_);
      }
      
      private function §_-Hd§() : void
      {
         var _loc1_:Array = null;
         var _loc2_:* = 0;
         var _loc3_:Hero = null;
         switch(this.id)
         {
            case §_-l1B§:
               this.§_-un§ = §_-y2Q§;
               break;
            case §_-2v§:
               _loc1_ = SquirrelCollection.instance.§_-f12§();
               _loc2_ = 0;
               while(_loc2_ < _loc1_.length)
               {
                  _loc3_ = SquirrelCollection.instance.get(_loc1_[_loc2_]);
                  if(!(Boolean(_loc3_ && !_loc3_.isHare) && Boolean(!_loc3_.shaman) && _loc1_[_loc2_] != Game.selfId))
                  {
                     _loc1_.splice(_loc2_,1);
                     _loc2_--;
                  }
                  _loc2_++;
               }
               this.§_-h1u§ = _loc1_.length != 0 ? int(_loc1_[int(Math.random() * _loc1_.length)]) : -1;
               break;
            case §_-l1L§:
               this.§_-un§ = §_-V28§[§_-QP§.§_-qa§(§_-92z§.location)];
               break;
            case §_-yE§:
               this.§_-un§ = Hero.self.shaman || SquirrelCollection.instance.§_-K14§().length == 0 ? 0 : §_-50§;
               break;
            case §_-A2§:
               this.§_-832§ = §_-a1N§ + Math.random() * (§_-6K§ - §_-a1N§);
               break;
            default:
               return;
         }
      }
      
      private function get §_-h1u§() : int
      {
         return this.§_-GZ§;
      }
      
      private function set §_-h1u§(param1:int) : void
      {
         this.§_-GZ§ = param1;
         if(this.§_-V2o§)
         {
            if(this.§_-V2o§.parent)
            {
               this.§_-V2o§.parent.removeChild(this.§_-V2o§);
            }
            this.§_-V2o§ = null;
         }
         if(param1 != -1)
         {
            this.§_-V2o§ = this.id == §_-l1B§ ? new QuestArrowGreen() : new QuestArrowRed();
            this.§_-V2o§.y = -70;
            SquirrelCollection.instance.get(this.§_-h1u§).addChild(this.§_-V2o§);
         }
         else
         {
            this.§_-un§ = 0;
         }
      }
      
      private function get §_-un§() : Number
      {
         return this.§_-VR§;
      }
      
      private function set §_-un§(param1:Number) : void
      {
         this.§_-VR§ = param1;
         if(!this.§_-o2E§)
         {
            this.§_-o2E§ = new §_-22V§("",0,-3,new TextFormat(§_-22V§.§_-F2z§,14,16777215,true));
            this.§_-Q2g§.addChild(this.§_-o2E§);
         }
         if(Boolean(Hero.self) && !this.§_-Q2g§.parent)
         {
            Hero.self.addChildAt(this.§_-Q2g§,0);
         }
      }
      
      private function §_-O27§() : void
      {
         var _loc5_:§_-kV§ = null;
         this.§_-63T§();
         this.§_-mG§ = new Vector.<§_-kV§>();
         this.§_-io§ = {};
         var _loc1_:int = 1;
         var _loc2_:Class = null;
         switch(this.id)
         {
            case §_-QX§:
               _loc1_ = §_-MS§;
               _loc2_ = §_-Ba§;
               break;
            case §_-RJ§:
               _loc1_ = §_-75§;
               _loc2_ = §_-T12§;
               break;
            case §_-A1r§:
               _loc2_ = §_-411§;
               break;
            case §_-b2S§:
               _loc1_ = §_-71g§;
               _loc2_ = §_-323§;
               break;
            case §_-K1c§:
               _loc2_ = §_-tt§;
               break;
            case §_-z14§:
               _loc2_ = §_-pY§;
               break;
            case §_-PJ§:
               _loc2_ = §_-ki§;
               break;
            default:
               return;
         }
         var _loc3_:Array = (GameMap.instance as GameMapNet).§_-S15§(SIZE,SIZE,_loc1_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = new _loc2_(Hero.self);
            _loc5_.position = _loc3_[_loc4_];
            GameMap.instance.add(_loc5_);
            this.§_-mG§.push(_loc5_);
            _loc4_++;
         }
      }
      
      private function §_-63T§() : void
      {
         var _loc1_:§_-kV§ = null;
         if(!this.§_-mG§ || !GameMap.instance)
         {
            return;
         }
         for each(_loc1_ in this.§_-mG§)
         {
            GameMap.instance.remove(_loc1_,true);
         }
      }
      
      private function §_-RB§(param1:§_-S2I§) : void
      {
         var _loc2_:Array = null;
         var _loc3_:§_-kV§ = null;
         switch(this.id)
         {
            case §_-r1y§:
               if(!(SquirrelCollection.instance is §_-p2§))
               {
                  return;
               }
               _loc2_ = (SquirrelCollection.instance as §_-p2§).§_-12z§;
               if(_loc2_.indexOf(param1[0]) == -1)
               {
                  return;
               }
               _loc2_.splice(_loc2_.indexOf(param1[0]),1);
               break;
            case §_-d1d§:
               if(param1[0] == Game.selfId || Boolean(this.§_-io§[param1[0]]))
               {
                  return;
               }
               _loc3_ = new §_-q1h§(Hero.self,param1[0]);
               _loc3_.position = new b2Vec2(param1[1],param1[2]);
               GameMap.instance.add(_loc3_);
               this.§_-mG§.push(_loc3_);
         }
      }
      
      private function onHollow(param1:§_-S2I§) : void
      {
         switch(this.id)
         {
            case §_-2v§:
               if(param1[1] == this.§_-h1u§)
               {
                  this.§_-h1u§ = -1;
               }
         }
         if(Game.selfId == param1[1])
         {
            this.§_-62g§();
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Hero = null;
         var _loc4_:int = 0;
         if(param1.type != §_-S2I§.§_-b1y§ && this.id == NONE)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-b1y§:
               _loc2_ = param1[1];
               if(!("questFactor" in _loc2_))
               {
                  return;
               }
               _loc3_ = SquirrelCollection.instance.get(param1[0]);
               if(_loc3_)
               {
                  _loc3_.questFactor *= _loc2_["questFactor"];
               }
               break;
            case §_-S2I§.§_-W1O§:
               if(param1[0] != §_-S2I§.ROUND_START)
               {
                  return;
               }
               this.§_-Hd§();
               this.§_-O27§();
               break;
            case §_-S2I§.§_-s27§:
               if(Boolean(this.§_-mG§) && this.§_-mG§.length > 0)
               {
                  break;
               }
               _loc4_ = (GameMap.instance as GameMapNet).§_-F2g§;
               if(_loc4_ != §_-S2I§.ROUND_PLAYING && _loc4_ != §_-S2I§.ROUND_START)
               {
                  break;
               }
               this.§_-Hd§();
               this.§_-O27§();
               break;
            case §_-S2I§.§_-F2m§:
               this.§_-RB§(param1);
               break;
            case §_-S2I§.§_-Vs§:
               if(param1[0] == 1)
               {
                  return;
               }
               this.onHollow(param1);
         }
      }
   }
}

