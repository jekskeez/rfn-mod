package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.§_-01S§;
   import §_-8Q§.§_-r2M§;
   import §_-8Q§.§_-u1i§;
   import §_-td§.GameMapNet;
   import protocol.§_-s2l§;
   
   public class §_-A23§ extends §_-92f§
   {
      
      public function §_-A23§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-7d§;
         this.§_-i1J§ = true;
      }
      
      override public function get maxCountUse() : int
      {
         return 1;
      }
      
      override public function get json() : String
      {
         var _loc4_:§_-r2M§ = null;
         var _loc5_:int = 0;
         var _loc6_:§_-01S§ = null;
         if(this.active)
         {
            return "";
         }
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         for each(_loc4_ in this.hero.game.map.elements)
         {
            if(_loc4_.§_-b1J§ != null)
            {
               if(!(!(_loc4_ is §_-u1i§) || (_loc4_ as §_-u1i§).§_-Gk§ != §_-u1i§.§_-13j§))
               {
                  _loc6_ = new §_-01S§();
                  _loc6_.itemId = (_loc4_ as §_-u1i§).itemId;
                  _loc6_.index = _loc4_.index;
                  _loc1_.push(_loc6_);
                  _loc2_.push(_loc4_.position.Copy());
                  _loc3_.push(_loc4_.index);
               }
            }
         }
         _loc2_ = _loc2_.concat((this.hero.game.map as GameMapNet).§_-s13§(2,2,_loc1_.length));
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc3_[_loc5_] = {
               "index":_loc3_[_loc5_],
               "position":_loc2_.splice(int(Math.random() * _loc2_.length),1)[0]
            };
            _loc5_++;
         }
         while(_loc1_.length > 0)
         {
            _loc6_ = _loc1_.pop();
            _loc3_.push({
               "mirageId":_loc6_.itemId,
               "mirageIndex":_loc6_.index,
               "position":_loc2_.splice(int(Math.random() * _loc2_.length),1)[0]
            });
         }
         return JSON.stringify(_loc3_);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:§_-01S§ = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  return;
               }
               if(param1[1] != this.§_-T2a§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               if(param1[2] != §_-s2l§.§_-x2Y§)
               {
                  return;
               }
               _loc2_ = param1[5];
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  if("index" in _loc2_[_loc3_])
                  {
                     this.hero.game.map.elements[_loc2_[_loc3_]["index"]].position = new b2Vec2(_loc2_[_loc3_]["position"]["x"],_loc2_[_loc3_]["position"]["y"]);
                  }
                  else
                  {
                     _loc4_ = new §_-01S§();
                     _loc4_.itemId = _loc2_[_loc3_]["mirageId"];
                     _loc4_.index = _loc2_[_loc3_]["mirageIndex"];
                     _loc4_.position = new b2Vec2(_loc2_[_loc3_]["position"]["x"],_loc2_[_loc3_]["position"]["y"]);
                     this.hero.game.map.add(_loc4_);
                     _loc4_.build(this.hero.game.world);
                  }
                  _loc3_++;
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
   }
}

