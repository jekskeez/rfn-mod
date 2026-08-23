package §_-p1g§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.PortalBlue;
   import §_-83V§.PortalRed;
   import §_-83V§.§_-Cn§;
   import §_-83V§.§_-GX§;
   import §_-83V§.§_-K1t§;
   import §_-83V§.§_-L1p§;
   import §_-83V§.§_-N1n§;
   import §_-83V§.§_-WQ§;
   import §_-83V§.§_-ej§;
   import §_-83V§.§_-f18§;
   import §_-83V§.§_-j2W§;
   import §_-83V§.§_-tT§;
   import §_-8I§.HollowEvent;
   import §_-A2x§.GameMapNet;
   import §_-B1O§.§_-W2J§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-R2L§;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class GameMapTwoShamansNet extends GameMapNet implements §_-y2r§
   {
      
      public var §_-11Q§:§_-R2L§ = new §_-R2L§();
      
      public var §_-o2W§:§_-R2L§ = new §_-R2L§();
      
      public function GameMapTwoShamansNet(param1:SquirrelGame)
      {
         super(param1);
      }
      
      public static function §_-41v§(param1:Array) : void
      {
         if(!param1)
         {
            return;
         }
         §_-23v§(param1,§_-03s§.§_-X21§(PortalBlue),[§_-N1n§,§_-ej§]);
         §_-23v§(param1,§_-03s§.§_-X21§(PortalRed),[§_-tT§,§_-f18§]);
         §_-23v§(param1,§_-03s§.§_-X21§(§_-K1t§),[§_-WQ§,§_-Cn§]);
         §_-23v§(param1,§_-03s§.§_-X21§(§_-j2W§),[§_-L1p§,§_-GX§]);
      }
      
      private static function §_-23v§(param1:Array, param2:int, param3:Array) : void
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
            param1.push(§_-03s§.§_-X21§(_loc5_));
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.redShamanPortals.§_-3s§();
         this.blueShamanPortals.§_-3s§();
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
      
      override protected function §_-sb§(param1:*, param2:Boolean = false) : void
      {
         super.§_-sb§(param1,param2);
         §_-41v§(this.§_-u1T§);
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
      
      override protected function onHollow(param1:HollowEvent) : void
      {
         §_-TQ§.add("GameMapTwoShamansNet.onHollow",this.isBrokenWorld);
         if(this.isBrokenWorld)
         {
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-Vs§,param1.§_-H2E§);
      }
   }
}

