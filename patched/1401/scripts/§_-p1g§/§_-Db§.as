package §_-p1g§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.§_-532§;
   import §_-83V§.§_-I11§;
   import §_-83V§.§_-P2o§;
   import §_-83V§.§_-Q1J§;
   import §_-B1O§.§_-S18§;
   import §_-B1O§.§_-T24§;
   import §_-B1O§.§_-W2J§;
   import §_-B1O§.§_-f24§;
   import §_-B1O§.§_-i26§;
   import §_-B1O§.§_-rJ§;
   import §_-Rj§.§_-K15§;
   import §_-Rj§.§_-y1z§;
   import §_-d11§.§_-k1J§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-R2L§;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-Db§ extends §_-K15§ implements §_-y2r§
   {
      
      public var §_-11Q§:§_-R2L§ = new §_-R2L§();
      
      public var §_-o2W§:§_-R2L§ = new §_-R2L§();
      
      public function §_-Db§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function §_-u2E§(param1:int, param2:int) : String
      {
         return §_-y1z§.§_-Gx§;
      }
      
      override public function §_-d1E§(param1:int, param2:int) : String
      {
         return §_-y1z§.§_-q6§;
      }
      
      override public function §_-WH§(param1:int, param2:int = -1) : Boolean
      {
         return get(§_-W2J§).length == 1 && get(§_-rJ§).length == 1 && §_-2S§(§_-f24§) && §_-2S§(§_-P2o§) && get(§_-I11§).length == 1 && get(§_-532§).length == 1;
      }
      
      override public function §_-Z2S§(param1:int, param2:int = -1) : Boolean
      {
         if(param1 == §_-q1p§.§_-G1z§)
         {
            return false;
         }
         return §_-2S§(§_-T24§) || §_-2S§(§_-S18§) || §_-2S§(§_-k1J§) || §_-2S§(§_-Q1J§) || §_-2S§(§_-i26§);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.redShamanPortals)
         {
            this.redShamanPortals.§_-3s§();
         }
         if(this.blueShamanPortals)
         {
            this.blueShamanPortals.§_-3s§();
         }
      }
      
      override public function clear() : void
      {
         if(this.redShamanPortals)
         {
            this.redShamanPortals.reset();
         }
         if(this.blueShamanPortals)
         {
            this.blueShamanPortals.reset();
         }
         super.clear();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-11Q§ = null;
         this.§_-o2W§ = null;
      }
      
      override public function §_-w1B§() : void
      {
         super.§_-w1B§();
         GameMapTwoShamansNet.§_-41v§(this.§_-u1T§);
      }
      
      public function get redShamanPortals() : §_-R2L§
      {
         return this.§_-11Q§;
      }
      
      public function get blueShamanPortals() : §_-R2L§
      {
         return this.§_-o2W§;
      }
      
      public function get redShamansPosition() : Vector.<b2Vec2>
      {
         var _loc3_:§_-63Q§ = null;
         var _loc1_:Array = get(§_-W2J§);
         var _loc2_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push(_loc3_.position);
         }
         return _loc2_;
      }
      
      public function get blueShamansPosition() : Vector.<b2Vec2>
      {
         return §_-p2U§;
      }
   }
}

