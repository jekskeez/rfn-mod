package §_-q0§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-O1O§.§_-H1P§;
   import §_-c2C§.§_-u24§;
   import §_-td§.GameMapNet;
   import flash.display.DisplayObject;
   import flash.text.TextFormat;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-gr§
   {
      
      private static const SIZE:int = 2;
      
      private static const §_-G1m§:int = 16;
      
      private static const §_-R1z§:int = 4;
      
      private static const §_-n1M§:int = 10;
      
      private static const §_-g9§:int = 15;
      
      private static const NONE:int = -1;
      
      private static const §_-Me§:int = 0;
      
      private static const §_-U1m§:int = 1;
      
      private static const §_-UM§:int = 2;
      
      private static const §_-J2X§:int = 3;
      
      private static const §_-C1p§:int = 4;
      
      private static const §_-MO§:int = 5;
      
      private static const §_-uU§:int = 6;
      
      private static const §_-31Z§:int = 7;
      
      private static const §_-q2p§:int = 8;
      
      private static const §_-433§:int = 9;
      
      private static const §_-VA§:int = 10;
      
      private static const §_-j29§:int = 11;
      
      private static const §_-K2W§:int = 12;
      
      private static const §_-B2O§:int = 13;
      
      private static const §_-22m§:Number = 10;
      
      private static const §_-52R§:Number = 10;
      
      private static const §_-qJ§:int = 8;
      
      private static const §_-c1r§:int = 5;
      
      private static const §_-c18§:int = 3;
      
      private static const §_-M2l§:int = 5;
      
      private static const §_-s1y§:Array = [60,60,90,160,80,90];
      
      private var id:int = -1;
      
      private var §_-e6§:Number = 0;
      
      private var §_-A1u§:int = -1;
      
      private var §_-43q§:Number = 0;
      
      private var §_-92A§:Vector.<§_-K1r§>;
      
      private var §_-HW§:Object = {};
      
      private var §_-53l§:QuestTimerBack = new QuestTimerBack();
      
      private var §_-43x§:DisplayObject;
      
      private var §_-L1t§:§_-i5§ = null;
      
      public function §_-gr§(param1:int)
      {
         super();
         this.id = param1;
         this.§_-53l§.y = -70;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§,§_-s2l§.§_-p1K§,§_-s2l§.§_-l11§,§_-s2l§.§_-n1f§,§_-s2l§.§_-v1r§]);
      }
      
      public static function get §_-U2Z§() : Boolean
      {
         switch(§_-kG§.§_-E1U§)
         {
            case §_-J2X§:
            case §_-MO§:
               return true;
            default:
               return false;
         }
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:§_-K1r§ = null;
         var _loc5_:Hero = null;
         if(!SquirrelGame.instance || !SquirrelCollection.instance)
         {
            return;
         }
         switch(this.id)
         {
            case NONE:
               return;
            case §_-Me§:
               _loc2_ = SquirrelCollection.instance.get(this.§_-H12§);
               if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || !Hero.self || Hero.self.isDead || Hero.self.inHollow)
               {
                  break;
               }
               _loc3_ = Hero.self.position.Copy();
               _loc3_.Subtract(_loc2_.position);
               if(_loc3_.Length() > §_-G1m§)
               {
                  this.§_-lQ§ -= param1;
               }
               break;
            case §_-U1m§:
               this.§_-lQ§ -= param1;
               break;
            case §_-31Z§:
               this.§_-43q§ -= param1;
               if(this.§_-43q§ > 0)
               {
                  return;
               }
               this.§_-43q§ = §_-n1M§ + Math.random() * (§_-g9§ - §_-n1M§);
               Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"questFactor":-1}));
               break;
            case §_-VA§:
               if(!Hero.self || Hero.self.shaman || Hero.self.isDead)
               {
                  break;
               }
               for each(_loc2_ in SquirrelCollection.instance.§_-wt§())
               {
                  _loc3_ = Hero.self.position.Copy();
                  _loc3_.Subtract(_loc2_.position);
                  if(_loc3_.Length() <= §_-R1z§)
                  {
                     this.§_-lQ§ -= param1;
                  }
               }
               break;
            case §_-B2O§:
               for each(_loc4_ in this.§_-92A§)
               {
                  this.§_-HW§[(_loc4_ as §_-y2G§).§_-C3W§] = _loc4_.activated;
               }
         }
         if(Boolean(this.§_-L1t§) && this.§_-lQ§ <= 0)
         {
            this.§_-53l§.removeChild(this.§_-L1t§);
            this.§_-L1t§ = null;
            if(this.§_-53l§.parent)
            {
               this.§_-53l§.parent.removeChild(this.§_-53l§);
            }
         }
         if(this.§_-L1t§)
         {
            this.§_-L1t§.text = this.§_-lQ§.toFixed(1);
            this.§_-L1t§.x = -int(this.§_-L1t§.textWidth * 0.5) - 3;
            if(Boolean(SquirrelGame.instance) && Boolean(SquirrelCollection.instance) && Boolean(Hero.self))
            {
               this.§_-53l§.scaleX = Hero.self.scale > 0 ? 1 : -1;
               this.§_-53l§.y = SquirrelCollection.instance.§_-o1w§ ? -100 : -70;
               this.§_-53l§.visible = Hero.§_-Cg§;
            }
         }
         if(this.§_-43x§)
         {
            _loc5_ = SquirrelCollection.instance.get(this.§_-H12§);
            this.§_-43x§.visible = Boolean(_loc5_) && !_loc5_.isDead && !_loc5_.inHollow;
         }
      }
      
      public function dispose() : void
      {
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§,§_-s2l§.§_-p1K§,§_-s2l§.§_-l11§,§_-s2l§.§_-n1f§,§_-s2l§.§_-v1r§]);
      }
      
      private function §_-Pp§() : void
      {
         var _loc3_:§_-K1r§ = null;
         var _loc1_:int = 1;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-92A§)
         {
            if(_loc3_.activated)
            {
               _loc2_++;
            }
         }
         switch(this.id)
         {
            case §_-Me§:
            case §_-U1m§:
            case §_-VA§:
               if(this.§_-lQ§ < 0)
               {
                  return;
               }
               break;
            case §_-UM§:
               if(!(SquirrelCollection.instance is §_-H1P§))
               {
                  return;
               }
               if((SquirrelCollection.instance as §_-H1P§).§_-Hh§.length != 0)
               {
                  return;
               }
               break;
            case §_-j29§:
               if(this.§_-H12§ == -1)
               {
                  return;
               }
               break;
            case §_-C1p§:
               if(_loc2_ < §_-c18§)
               {
                  return;
               }
               break;
            case §_-q2p§:
               if((this.§_-92A§[0] as §_-b1V§).count == 0)
               {
                  return;
               }
               _loc1_ = (this.§_-92A§[0] as §_-b1V§).count;
               break;
            case §_-MO§:
            case §_-433§:
            case §_-K2W§:
               if(_loc2_ == 0)
               {
                  return;
               }
               break;
            case §_-J2X§:
            case §_-uU§:
               if(_loc2_ == 0)
               {
                  return;
               }
               _loc1_ = _loc2_;
               break;
            case §_-B2O§:
               if(_loc2_ == 0)
               {
                  return;
               }
               _loc1_ = _loc2_;
         }
         §_-kG§.§_-V24§(this.id,_loc1_);
      }
      
      private function §_-Q2n§() : void
      {
         var _loc1_:Array = null;
         var _loc2_:* = 0;
         var _loc3_:Hero = null;
         switch(this.id)
         {
            case §_-Me§:
               this.§_-lQ§ = §_-22m§;
               break;
            case §_-j29§:
               _loc1_ = SquirrelCollection.instance.§_-n2K§();
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
               this.§_-H12§ = _loc1_.length != 0 ? int(_loc1_[int(Math.random() * _loc1_.length)]) : -1;
               break;
            case §_-U1m§:
               this.§_-lQ§ = §_-s1y§[§_-u1x§.§_-F2J§(§_-u24§.location)];
               break;
            case §_-VA§:
               this.§_-lQ§ = Hero.self.shaman || SquirrelCollection.instance.§_-wt§().length == 0 ? 0 : §_-52R§;
               break;
            case §_-31Z§:
               this.§_-43q§ = §_-n1M§ + Math.random() * (§_-g9§ - §_-n1M§);
               break;
            default:
               return;
         }
      }
      
      private function get §_-H12§() : int
      {
         return this.§_-A1u§;
      }
      
      private function set §_-H12§(param1:int) : void
      {
         this.§_-A1u§ = param1;
         if(this.§_-43x§)
         {
            if(this.§_-43x§.parent)
            {
               this.§_-43x§.parent.removeChild(this.§_-43x§);
            }
            this.§_-43x§ = null;
         }
         if(param1 != -1)
         {
            this.§_-43x§ = this.id == §_-Me§ ? new QuestArrowGreen() : new QuestArrowRed();
            this.§_-43x§.y = -70;
            SquirrelCollection.instance.get(this.§_-H12§).addChild(this.§_-43x§);
         }
         else
         {
            this.§_-lQ§ = 0;
         }
      }
      
      private function get §_-lQ§() : Number
      {
         return this.§_-e6§;
      }
      
      private function set §_-lQ§(param1:Number) : void
      {
         this.§_-e6§ = param1;
         if(!this.§_-L1t§)
         {
            this.§_-L1t§ = new §_-i5§("",0,-3,new TextFormat(§_-i5§.§_-c10§,14,16777215,true));
            this.§_-53l§.addChild(this.§_-L1t§);
         }
         if(Boolean(Hero.self) && !this.§_-53l§.parent)
         {
            Hero.self.addChildAt(this.§_-53l§,0);
         }
      }
      
      private function §_-32A§() : void
      {
         var _loc5_:§_-K1r§ = null;
         this.§_-y7§();
         this.§_-92A§ = new Vector.<§_-K1r§>();
         this.§_-HW§ = {};
         var _loc1_:int = 1;
         var _loc2_:Class = null;
         switch(this.id)
         {
            case §_-J2X§:
               _loc1_ = §_-qJ§;
               _loc2_ = §_-W1O§;
               break;
            case §_-C1p§:
               _loc1_ = §_-c1r§;
               _loc2_ = §_-811§;
               break;
            case §_-MO§:
               _loc2_ = §_-ZB§;
               break;
            case §_-uU§:
               _loc1_ = §_-M2l§;
               _loc2_ = §_-Yo§;
               break;
            case §_-q2p§:
               _loc2_ = §_-b1V§;
               break;
            case §_-433§:
               _loc2_ = §_-a2g§;
               break;
            case §_-K2W§:
               _loc2_ = §_-xW§;
               break;
            default:
               return;
         }
         var _loc3_:Array = (GameMap.instance as GameMapNet).§_-s13§(SIZE,SIZE,_loc1_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = new _loc2_(Hero.self);
            _loc5_.position = _loc3_[_loc4_];
            GameMap.instance.add(_loc5_);
            this.§_-92A§.push(_loc5_);
            _loc4_++;
         }
      }
      
      private function §_-y7§() : void
      {
         var _loc1_:§_-K1r§ = null;
         if(!this.§_-92A§ || !GameMap.instance)
         {
            return;
         }
         for each(_loc1_ in this.§_-92A§)
         {
            GameMap.instance.remove(_loc1_,true);
         }
      }
      
      private function §_-tw§(param1:§_-s2l§) : void
      {
         var _loc2_:Array = null;
         var _loc3_:§_-K1r§ = null;
         switch(this.id)
         {
            case §_-UM§:
               if(!(SquirrelCollection.instance is §_-H1P§))
               {
                  return;
               }
               _loc2_ = (SquirrelCollection.instance as §_-H1P§).§_-Hh§;
               if(_loc2_.indexOf(param1[0]) == -1)
               {
                  return;
               }
               _loc2_.splice(_loc2_.indexOf(param1[0]),1);
               break;
            case §_-B2O§:
               if(param1[0] == Game.selfId || Boolean(this.§_-HW§[param1[0]]))
               {
                  return;
               }
               _loc3_ = new §_-y2G§(Hero.self,param1[0]);
               _loc3_.position = new b2Vec2(param1[1],param1[2]);
               GameMap.instance.add(_loc3_);
               this.§_-92A§.push(_loc3_);
         }
      }
      
      private function onHollow(param1:§_-s2l§) : void
      {
         switch(this.id)
         {
            case §_-j29§:
               if(param1[1] == this.§_-H12§)
               {
                  this.§_-H12§ = -1;
               }
         }
         if(Game.selfId == param1[1])
         {
            this.§_-Pp§();
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Hero = null;
         var _loc4_:int = 0;
         if(param1.type != §_-s2l§.§_-1q§ && this.id == NONE)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-1q§:
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
            case §_-s2l§.§_-p1K§:
               if(param1[0] != §_-s2l§.ROUND_START)
               {
                  return;
               }
               this.§_-Q2n§();
               this.§_-32A§();
               break;
            case §_-s2l§.§_-l11§:
               if(Boolean(this.§_-92A§) && this.§_-92A§.length > 0)
               {
                  break;
               }
               _loc4_ = (GameMap.instance as GameMapNet).§_-j2F§;
               if(_loc4_ != §_-s2l§.ROUND_PLAYING && _loc4_ != §_-s2l§.ROUND_START)
               {
                  break;
               }
               this.§_-Q2n§();
               this.§_-32A§();
               break;
            case §_-s2l§.§_-v1r§:
               this.§_-tw§(param1);
               break;
            case §_-s2l§.§_-n1f§:
               if(param1[0] == 1)
               {
                  return;
               }
               this.onHollow(param1);
         }
      }
   }
}

