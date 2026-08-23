package §_-T1r§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.§_-532§;
   import §_-83V§.§_-I11§;
   import §_-83V§.§_-P2o§;
   import §_-83V§.§_-Q1J§;
   import §_-B1O§.§_-S18§;
   import §_-B1O§.§_-T24§;
   import §_-B1O§.§_-i26§;
   import §_-Rj§.§_-K15§;
   import §_-Rj§.§_-y1z§;
   import §_-d11§.§_-k1J§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-p13§ extends §_-K15§
   {
      
      public function §_-p13§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function §_-WH§(param1:int, param2:int = -1) : Boolean
      {
         return §_-2S§(§_-S18§) && §_-2S§(§_-T24§) && §_-2S§(§_-k1J§);
      }
      
      override public function §_-u2E§(param1:int, param2:int) : String
      {
         return §_-y1z§.§_-jZ§;
      }
      
      override public function §_-d1E§(param1:int, param2:int) : String
      {
         return §_-y1z§.§_-I22§;
      }
      
      override public function §_-Z2S§(param1:int, param2:int = -1) : Boolean
      {
         return §_-2S§(§_-P2o§) || §_-2S§(§_-Q1J§) || §_-2S§(§_-I11§) || §_-2S§(§_-532§) || §_-2S§(§_-i26§);
      }
      
      override protected function §_-AH§() : Array
      {
         return [];
      }
      
      override public function §_-438§() : int
      {
         return super.§_-438§() + get(§_-S18§).length + get(§_-T24§).length;
      }
      
      public function §_-fw§(param1:Class) : Vector.<b2Vec2>
      {
         var _loc4_:§_-63Q§ = null;
         var _loc2_:Array = get(param1);
         var _loc3_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc4_ in _loc2_)
         {
            _loc3_.push(_loc4_.position);
         }
         return _loc3_;
      }
      
      public function get §_-s2t§() : Vector.<b2Vec2>
      {
         return this.§_-fw§(§_-S18§);
      }
      
      public function get §_-E2f§() : Vector.<b2Vec2>
      {
         return this.§_-fw§(§_-T24§);
      }
   }
}

