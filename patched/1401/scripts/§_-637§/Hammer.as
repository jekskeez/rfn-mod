package §_-637§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-83V§.§_-3p§;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-s1i§;
   import §_-Y22§.§_-C2x§;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-U1N§;
   import game.mainGame.entity.§_-63Q§;
   import sounds.GameSounds;
   import starling.core.Starling;
   import utils.§_-X2Z§;
   
   public class Hammer extends §_-h2I§ implements §_-63Q§, §_-J14§, §_-C2x§, §_-03u§, §_-U1N§
   {
      
      private const §_-23S§:Array = [new GlowFilter(52224,1,5,5,50,1,true,true)];
      
      private var §_-rk§:§_-3p§ = null;
      
      private var §_-j1O§:SquirrelGame;
      
      public function Hammer()
      {
         super();
         §_-83v§(new §_-h2I§(new HammerView()));
         §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-iZ§);
      }
      
      private function §_-iZ§(param1:TouchEvent = null) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage);
         if(!_loc2_ || !this.§_-j1O§ || !this.§_-j1O§.map)
         {
            return;
         }
         this.§_-M1k§(_loc2_);
      }
      
      public function §_-v1D§(param1:§_-e2m§) : void
      {
         this.§_-M1k§(param1);
      }
      
      private function §_-M1k§(param1:§_-e2m§) : void
      {
         var _loc5_:§_-3p§ = null;
         var _loc6_:Point = null;
         if(!param1 || !this.§_-j1O§ || !this.§_-j1O§.map)
         {
            return;
         }
         var _loc2_:Point = new Point(param1.§_-n2h§,param1.§_-Zv§);
         var _loc3_:Array = this.§_-j1O§.map.get(§_-3p§);
         if(_loc3_.length == 0)
         {
            return;
         }
         var _loc4_:Array = [];
         if(Hero.self)
         {
            for each(_loc5_ in _loc3_)
            {
               _loc6_ = _loc5_.globalToLocal(_loc2_);
               if(_loc5_.§_-B2M§(_loc6_) && !_loc5_.§_-31k§)
               {
                  _loc4_.push(_loc5_);
               }
            }
         }
         this.§_-S1c§ = §_-X2Z§.§_-C16§(_loc4_) as §_-3p§;
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
      }
      
      public function get angle() : Number
      {
         return 0;
      }
      
      public function set angle(param1:Number) : void
      {
      }
      
      public function build(param1:b2World) : void
      {
         var _loc2_:GameMap = (param1.userData as SquirrelGame).map;
         if(this.§_-S1c§)
         {
            this.§_-S1c§.§_-039§();
         }
         this.visible = false;
         _loc2_.remove(this);
         this.dispose();
      }
      
      public function set game(param1:SquirrelGame) : void
      {
         this.§_-j1O§ = param1;
      }
      
      public function §_-qB§() : void
      {
         GameSounds.play("craft");
      }
      
      public function §_-PS§() : void
      {
      }
      
      public function §_-23§() : void
      {
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
         }
         this.§_-S1c§ = null;
         this.game = null;
         if(this.parentStarling != null)
         {
            this.parentStarling.removeChildStarling(this);
         }
         this.removeFromParent();
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-iZ§);
      }
      
      public function §_-A1X§() : *
      {
         return [[this.position.x,this.position.y],this.§_-S1c§.id];
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.§_-S1c§ = this.§_-j1O§.map.getObject(param1[1]) as §_-3p§;
      }
      
      public function get §_-S1c§() : §_-3p§
      {
         return this.§_-rk§;
      }
      
      public function set §_-S1c§(param1:§_-3p§) : void
      {
         if(this.§_-rk§ == param1)
         {
            return;
         }
         if(this.§_-rk§)
         {
            this.§_-rk§.filters = [];
         }
         if(param1)
         {
            param1.filters = this.§_-23S§;
         }
         this.§_-rk§ = param1;
      }
   }
}

