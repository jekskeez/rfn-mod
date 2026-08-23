package §_-r1M§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.§_-I1j§;
   import §_-8Q§.§_-O1Y§;
   import §_-8Q§.§_-O2k§;
   import §_-8Q§.§_-t20§;
   import §_-g16§.§_-I2§;
   import §_-j2H§.§_-62Y§;
   import §_-j2H§.§_-H18§;
   import §_-j2H§.§_-Jb§;
   import §_-j2H§.§_-Y2n§;
   import §_-j2H§.§_-r29§;
   import §_-j2H§.§_-x2h§;
   import §_-l2u§.§_-53A§;
   import §_-l2u§.§_-CD§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-g1f§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-IL§ extends §_-53A§ implements §_-b13§
   {
      
      public var §_-E2l§:§_-g1f§ = new §_-g1f§();
      
      public var §_-73I§:§_-g1f§ = new §_-g1f§();
      
      public function §_-IL§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function §_-h2S§(param1:int, param2:int) : String
      {
         return §_-CD§.§_-mj§;
      }
      
      override public function §_-42C§(param1:int, param2:int) : String
      {
         return §_-CD§.§_-Q27§;
      }
      
      override public function §_-538§(param1:int, param2:int = -1) : Boolean
      {
         return get(§_-r29§).length == 1 && get(§_-62Y§).length == 1 && §_-FS§(§_-x2h§) && §_-FS§(§_-O2k§) && get(§_-I1j§).length == 1 && get(§_-O1Y§).length == 1;
      }
      
      override public function §_-vd§(param1:int, param2:int = -1) : Boolean
      {
         if(param1 == §_-at§.§_-Uf§)
         {
            return false;
         }
         return §_-FS§(§_-Jb§) || §_-FS§(§_-Y2n§) || §_-FS§(§_-I2§) || §_-FS§(§_-t20§) || §_-FS§(§_-H18§);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.redShamanPortals)
         {
            this.redShamanPortals.§_-vp§();
         }
         if(this.blueShamanPortals)
         {
            this.blueShamanPortals.§_-vp§();
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
         this.§_-E2l§ = null;
         this.§_-73I§ = null;
      }
      
      override public function §_-Q1J§() : void
      {
         super.§_-Q1J§();
         GameMapTwoShamansNet.§_-t1n§(this.§_-d14§);
      }
      
      public function get redShamanPortals() : §_-g1f§
      {
         return this.§_-E2l§;
      }
      
      public function get blueShamanPortals() : §_-g1f§
      {
         return this.§_-73I§;
      }
      
      public function get redShamansPosition() : Vector.<b2Vec2>
      {
         var _loc3_:§_-xn§ = null;
         var _loc1_:Array = get(§_-r29§);
         var _loc2_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push(_loc3_.position);
         }
         return _loc2_;
      }
      
      public function get blueShamansPosition() : Vector.<b2Vec2>
      {
         return §_-02q§;
      }
   }
}

