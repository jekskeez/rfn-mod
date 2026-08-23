package §_-r1M§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.PortalBlue;
   import §_-8Q§.PortalRed;
   import §_-8Q§.§_-B2i§;
   import §_-8Q§.§_-K2j§;
   import §_-8Q§.§_-N23§;
   import §_-8Q§.§_-Pl§;
   import §_-8Q§.§_-gG§;
   import §_-8Q§.§_-nI§;
   import §_-8Q§.§_-q2D§;
   import §_-8Q§.§_-xA§;
   import §_-8Q§.§_-y2g§;
   import §_-8Q§.§_-z2J§;
   import §_-X2V§.HollowEvent;
   import §_-j2H§.§_-r29§;
   import §_-td§.GameMapNet;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-g1f§;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-xn§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class GameMapTwoShamansNet extends GameMapNet implements §_-b13§
   {
      
      public var §_-E2l§:§_-g1f§ = new §_-g1f§();
      
      public var §_-73I§:§_-g1f§ = new §_-g1f§();
      
      public function GameMapTwoShamansNet(param1:SquirrelGame)
      {
         super(param1);
      }
      
      public static function §_-t1n§(param1:Array) : void
      {
         if(!param1)
         {
            return;
         }
         §_-v2a§(param1,§_-f1b§.§_-q2W§(PortalBlue),[§_-nI§,§_-K2j§]);
         §_-v2a§(param1,§_-f1b§.§_-q2W§(PortalRed),[§_-B2i§,§_-xA§]);
         §_-v2a§(param1,§_-f1b§.§_-q2W§(§_-z2J§),[§_-gG§,§_-Pl§]);
         §_-v2a§(param1,§_-f1b§.§_-q2W§(§_-q2D§),[§_-y2g§,§_-N23§]);
      }
      
      private static function §_-v2a§(param1:Array, param2:int, param3:Array) : void
      {
         var _loc5_:Class = null;
         var _loc4_:int = param1.indexOf(param2);
         if(_loc4_ == -1)
         {
            return;
         }
         param1.splice(_loc4_,1);
         for each(_loc5_ in param3)
         {
            param1.push(§_-f1b§.§_-q2W§(_loc5_));
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.redShamanPortals.§_-vp§();
         this.blueShamanPortals.§_-vp§();
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
      
      override protected function §_-a2f§(param1:*, param2:Boolean = false) : void
      {
         super.§_-a2f§(param1,param2);
         §_-t1n§(this.§_-d14§);
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
      
      override protected function onHollow(param1:HollowEvent) : void
      {
         §_-p2U§.add("GameMapTwoShamansNet.onHollow",this.isBrokenWorld);
         if(this.isBrokenWorld)
         {
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-n1f§,param1.§_-NV§);
      }
   }
}

