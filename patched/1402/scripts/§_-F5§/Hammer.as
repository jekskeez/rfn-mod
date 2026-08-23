package §_-F5§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.§_-Lr§;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-c2C§.§_-817§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-J1a§;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-L1Q§;
   import game.mainGame.entity.§_-xn§;
   import sounds.GameSounds;
   import starling.core.Starling;
   import utils.§_-H1o§;
   
   public class Hammer extends §_-aS§ implements §_-xn§, §_-Q1r§, §_-l2r§, §_-3l§, §_-L1Q§
   {
      
      private const §_-D2X§:Array = [new GlowFilter(52224,1,5,5,50,1,true,true)];
      
      private var §_-Lx§:§_-Lr§ = null;
      
      private var §_-Y2e§:SquirrelGame;
      
      public function Hammer()
      {
         super();
         §_-J2J§(new §_-aS§(new HammerView()));
         §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-6G§);
      }
      
      private function §_-6G§(param1:TouchEvent = null) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage);
         if(!_loc2_ || !this.§_-Y2e§ || !this.§_-Y2e§.map)
         {
            return;
         }
         this.§_-l1R§(_loc2_);
      }
      
      public function §_-n1o§(param1:§_-J1a§) : void
      {
         this.§_-l1R§(param1);
      }
      
      private function §_-l1R§(param1:§_-J1a§) : void
      {
         var _loc5_:§_-Lr§ = null;
         var _loc6_:Point = null;
         if(!param1 || !this.§_-Y2e§ || !this.§_-Y2e§.map)
         {
            return;
         }
         var _loc2_:Point = new Point(param1.§_-ca§,param1.§_-n2z§);
         var _loc3_:Array = this.§_-Y2e§.map.get(§_-Lr§);
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
               if(_loc5_.§_-Jz§(_loc6_) && !_loc5_.§_-p2i§)
               {
                  _loc4_.push(_loc5_);
               }
            }
         }
         this.§_-T1V§ = §_-H1o§.§_-XF§(_loc4_) as §_-Lr§;
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
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
         if(this.§_-T1V§)
         {
            this.§_-T1V§.§_-03s§();
         }
         this.visible = false;
         _loc2_.remove(this);
         this.dispose();
      }
      
      public function set game(param1:SquirrelGame) : void
      {
         this.§_-Y2e§ = param1;
      }
      
      public function §_-03o§() : void
      {
         GameSounds.play("craft");
      }
      
      public function §_-t2Q§() : void
      {
      }
      
      public function §_-Va§() : void
      {
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         this.§_-T1V§ = null;
         this.game = null;
         if(this.parentStarling != null)
         {
            this.parentStarling.removeChildStarling(this);
         }
         this.removeFromParent();
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-6G§);
      }
      
      public function §_-m1Y§() : *
      {
         return [[this.position.x,this.position.y],this.§_-T1V§.id];
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.§_-T1V§ = this.§_-Y2e§.map.getObject(param1[1]) as §_-Lr§;
      }
      
      public function get §_-T1V§() : §_-Lr§
      {
         return this.§_-Lx§;
      }
      
      public function set §_-T1V§(param1:§_-Lr§) : void
      {
         if(this.§_-Lx§ == param1)
         {
            return;
         }
         if(this.§_-Lx§)
         {
            this.§_-Lx§.filters = [];
         }
         if(param1)
         {
            param1.filters = this.§_-D2X§;
         }
         this.§_-Lx§ = param1;
      }
   }
}

