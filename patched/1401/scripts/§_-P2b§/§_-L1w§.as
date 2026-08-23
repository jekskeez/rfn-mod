package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.§_-n19§;
   import §_-83V§.§_-o29§;
   import §_-83V§.§_-r1o§;
   import §_-A2x§.GameMapNet;
   import protocol.§_-S2I§;
   
   public class §_-L1w§ extends §_-H2N§
   {
      
      public function §_-L1w§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-VU§;
         this.§_-mw§ = true;
      }
      
      override public function get maxCountUse() : int
      {
         return 1;
      }
      
      override public function get json() : String
      {
         var _loc4_:§_-r1o§ = null;
         var _loc5_:int = 0;
         var _loc6_:§_-n19§ = null;
         if(this.active)
         {
            return "";
         }
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         for each(_loc4_ in this.hero.game.map.elements)
         {
            if(_loc4_.§_-V2K§ != null)
            {
               if(!(!(_loc4_ is §_-o29§) || (_loc4_ as §_-o29§).§_-y2u§ != §_-o29§.§_-Y1l§))
               {
                  _loc6_ = new §_-n19§();
                  _loc6_.itemId = (_loc4_ as §_-o29§).itemId;
                  _loc6_.index = _loc4_.index;
                  _loc1_.push(_loc6_);
                  _loc2_.push(_loc4_.position.Copy());
                  _loc3_.push(_loc4_.index);
               }
            }
         }
         _loc2_ = _loc2_.concat((this.hero.game.map as GameMapNet).§_-S15§(2,2,_loc1_.length));
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
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:§_-n19§ = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  return;
               }
               if(param1[1] != this.§_-i2D§ || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
               if(param1[2] != §_-S2I§.§_-EY§)
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
                     _loc4_ = new §_-n19§();
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
               super.§_-o2C§(param1);
         }
      }
   }
}

