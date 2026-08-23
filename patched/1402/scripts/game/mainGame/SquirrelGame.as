package game.mainGame
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-Mq§.DisplayObjectManager;
   import §_-TK§.§_-aS§;
   import §_-bN§.Dialog;
   import §_-c2C§.§_-u24§;
   import §_-j2H§.§_-D1T§;
   import chat.§_-g1j§;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   import luaAlchemy.LuaAlchemy;
   import protocol.§_-s2l§;
   import utils.§_-d1t§;
   
   public class SquirrelGame extends §_-aS§
   {
      
      public static const §_-e2e§:Number = 0.8;
      
      private static const §_-m1a§:Number = 0.016666666666666666;
      
      private static const §_-74§:int = 8;
      
      private static const §_-p1D§:int = 3;
      
      private static const §_-j2V§:Boolean = true;
      
      private static const §_-E14§:Number = 0.9;
      
      public static const §_-fM§:b2Vec2 = new b2Vec2(0,100);
      
      protected static var §_-12U§:Dialog = null;
      
      private static var _instance:SquirrelGame = null;
      
      public var world:b2World = new b2World(§_-fM§,true);
      
      public var map:GameMap;
      
      public var squirrels:SquirrelCollection;
      
      public var cast:Cast;
      
      public var camera:§_-e1Q§;
      
      public var §_-Qd§:§_-439§;
      
      public var §_-2Q§:LuaAlchemy = new LuaAlchemy();
      
      public var §_-O1B§:§_-k2S§ = new §_-k2S§();
      
      public var §_-W1Q§:§_-aS§ = new §_-aS§();
      
      public var §_-O1C§:§_-D1T§ = new §_-D1T§();
      
      public var §_-w2g§:Number = 0.9;
      
      protected var §_-a25§:Boolean = false;
      
      protected var §_-W1r§:DisplayObjectContainer = null;
      
      private var §_-a1x§:§_-S2J§ = new §_-S2J§();
      
      private var §_-D2Q§:Boolean = false;
      
      private var §_-H1m§:int;
      
      private var §_-S1U§:Number = 0;
      
      private var §_-G2r§:§_-s1V§ = null;
      
      private var §_-pA§:Object = {};
      
      public function SquirrelGame()
      {
         _instance = this;
         §_-p2U§.add("SquirrelGame.SquirrelGame");
         super();
         §_-d1t§.§_-B12§(this);
         this.world.userData = this;
         this.§_-W1Q§.mouseEnabled = false;
         this.§_-W1Q§.mouseChildren = false;
         addChild(this.map);
         §_-J2J§(this.squirrels);
         addChild(this.squirrels);
         §_-J2J§(this.map.§_-n2B§);
         this.§_-O1C§.visible = false;
         §_-J2J§(this.§_-O1C§);
         if(this.cast)
         {
            §_-J2J§(this.cast);
         }
         this.world.SetContactListener(new §_-E1T§(this.world));
         this.world.SetContactFilter(this.§_-O1B§);
         this.camera = new §_-e1Q§(this);
         this.§_-Qd§ = new §_-439§(this.map);
         §_-J2J§(this.§_-Qd§);
         this.§_-G2r§ = new §_-s1V§(this);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
         this.§_-W1N§();
      }
      
      public static function get instance() : SquirrelGame
      {
         return _instance;
      }
      
      public function §_-M6§() : Boolean
      {
         this.§_-a1x§.§_-b2y§ = this.§_-W1r§;
         return this.§_-a1x§.§_-M6§();
      }
      
      public function §_-l2y§(param1:Point) : Boolean
      {
         this.§_-a1x§.§_-b2y§ = this.§_-W1r§;
         return this.§_-a1x§.§_-gL§(param1);
      }
      
      public function get §_-T1y§() : Boolean
      {
         return this.§_-O1C§.visible;
      }
      
      public function set §_-T1y§(param1:Boolean) : void
      {
         if(this.§_-O1C§.visible == param1)
         {
            return;
         }
         this.§_-O1C§.visible = param1;
      }
      
      public function get scriptUtils() : §_-s1V§
      {
         if(!this.§_-G2r§)
         {
            §_-p2U§.add("Init LuaAlchemy");
            this.§_-2Q§ = new LuaAlchemy();
            this.§_-G2r§ = new §_-s1V§(this);
         }
         return this.§_-G2r§;
      }
      
      public function §_-s2p§() : void
      {
         if(!§_-12U§)
         {
            return;
         }
         if(§_-12U§.visible)
         {
            §_-12U§.hide();
         }
         else
         {
            §_-12U§.show();
         }
      }
      
      public function round(param1:Array) : void
      {
         if(Game.activated)
         {
            while(true)
            {
               if(Game.state != 7)
               {
                  if(Game.state != 8)
                  {
                     if(Game.state != 9)
                     {
                        if(Game.state != 11)
                        {
                           break;
                        }
                     }
                  }
               }
               Game.state = 12;
               Game.time = getTimer();
               Game.target = null;
               §_-u24§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 22 секунды.",§_-g1j§.§_-j1p§);
               break;
            }
         }
         if(Game.activated)
         {
            while(true)
            {
               if(Game.state != 7)
               {
                  if(Game.state != 8)
                  {
                     if(Game.state != 9)
                     {
                        if(Game.state != 11)
                        {
                           break;
                        }
                     }
                  }
               }
               Game.state = 1;
               Game.time = getTimer();
               Game.target = null;
               §_-u24§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 10 секунд.",§_-g1j§.§_-j1p§);
               break;
            }
         }
         this.cast.round(param1);
         this.map.round(param1);
         this.squirrels.round(param1);
         if(§_-12U§ != null)
         {
            if(param1[0] == §_-s2l§.§_-02x§)
            {
               §_-12U§.show();
            }
            else
            {
               §_-12U§.hide();
            }
         }
         this.§_-733§();
      }
      
      public function get gravity() : b2Vec2
      {
         return this.world.GetGravity();
      }
      
      public function set gravity(param1:b2Vec2) : void
      {
         this.world.SetGravity(param1);
      }
      
      public function set shift(param1:Point) : void
      {
         if(int(param1.x) != this.map.x || int(param1.y) != this.map.y)
         {
            this.squirrels.x = this.map.§_-n2B§.x = int(param1.x);
            this.squirrels.y = this.map.§_-n2B§.y = int(param1.y);
            this.map.shift = param1;
            this.§_-O1C§.§_-H15§ = new Point(this.map.x,this.map.y);
         }
         this.§_-526§();
      }
      
      public function §_-526§() : void
      {
         if(!this.cast)
         {
            return;
         }
         this.cast.x = int(this.map.x);
         this.cast.y = int(this.map.y);
      }
      
      public function get shift() : Point
      {
         return new Point(this.map.x,this.map.y);
      }
      
      public function get §_-d§() : Boolean
      {
         return this.§_-a25§;
      }
      
      public function set §_-d§(param1:Boolean) : void
      {
         if(this.§_-a25§ == param1)
         {
            return;
         }
         this.§_-a25§ = param1;
         if(!param1)
         {
            §_-p1V§.§_-DO§(this.onUpdate);
            return;
         }
         this.paused = false;
         this.§_-H1m§ = getTimer();
         this.§_-S1U§ = 0;
         §_-p1V§.§_-A3z§(this.onUpdate);
         this.map.build(this.world);
      }
      
      public function get paused() : Boolean
      {
         return this.§_-D2Q§;
      }
      
      public function set paused(param1:Boolean) : void
      {
         if(this.§_-D2Q§ == param1)
         {
            return;
         }
         this.§_-D2Q§ = param1;
      }
      
      public function addHintArrow(param1:String, param2:Point, param3:Number) : void
      {
         if(param1 in this.§_-pA§)
         {
            return;
         }
         var _loc4_:ArrowMovie = new ArrowMovie();
         _loc4_.x = param2.x - 13;
         _loc4_.y = param2.y;
         _loc4_.rotation = (param3 - 90) / Game.D2R;
         if(contains(_loc4_))
         {
            return;
         }
         addChild(_loc4_);
         this.§_-pA§[param1] = _loc4_;
      }
      
      public function removeHintArrow(param1:String) : void
      {
         if(!(param1 in this.§_-pA§))
         {
            return;
         }
         removeChild(this.§_-pA§[param1]);
         this.§_-pA§[param1] = null;
         delete this.§_-pA§[param1];
      }
      
      public function §_-733§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-pA§)
         {
            this.removeHintArrow(_loc1_);
         }
      }
      
      public function dispose() : void
      {
         if(Game.activated)
         {
            if(Hero.self != null)
            {
               Hero.self.immortal = Game.immortal;
            }
            Game.activated = false;
            Game.state = 0;
            Game.target = null;
         }
         §_-73Q§.removeEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
         §_-p2U§.add("SquirrelGame.dispose");
         §_-d1t§.§_-xx§(this);
         this.map.dispose();
         this.map = null;
         §_-p2U§.add("SquirrelGame.cast");
         if(this.cast)
         {
            this.cast.dispose();
         }
         this.cast = null;
         §_-p2U§.add("SquirrelGame.squirrels");
         if(this.squirrels != null)
         {
            this.squirrels.dispose();
         }
         this.squirrels = null;
         this.§_-O1C§.dispose();
         this.§_-O1C§ = null;
         §_-p2U§.add("SquirrelGame.world");
         this.world.SetDestructionListener(null);
         this.world.SetContactListener(null);
         this.world.userData = null;
         this.§_-d§ = false;
         this.world = null;
         §_-p2U§.add("SquirrelGame.removeChild");
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         §_-p2U§.add("SquirrelGame.scriptUtils");
         if(this.§_-G2r§)
         {
            this.§_-G2r§.dispose();
         }
         §_-p2U§.add("SquirrelGame.script");
         if(this.§_-2Q§)
         {
            this.§_-2Q§.close();
         }
         this.§_-G2r§ = null;
         this.§_-2Q§ = null;
         §_-p2U§.add("SquirrelGame.sideIcon");
         if(this.§_-Qd§)
         {
            this.§_-Qd§.dispose();
         }
         this.§_-Qd§ = null;
         §_-p2U§.add("SquirrelGame.camera");
         if(this.camera)
         {
            this.camera.dispose();
         }
         this.camera = null;
         this.§_-O1B§ = null;
         §_-p2U§.add("SquirrelGame.DisplayObjectManager.disposeExcess()");
         DisplayObjectManager.getInstance().§_-q1y§();
         if(§_-12U§)
         {
            §_-12U§.hide();
         }
         if(_instance == this)
         {
            _instance = null;
         }
      }
      
      public function update(param1:Number) : void
      {
         var simulateTimeStep:Number;
         var timeStep:Number = param1;
         if(!this.§_-d§)
         {
            return;
         }
         if(this.paused)
         {
            this.§_-S1U§ = 0;
            return;
         }
         this.§_-S1U§ += timeStep;
         simulateTimeStep = §_-j2V§ ? §_-m1a§ / this.§_-w2g§ : this.§_-S1U§;
         while(this.§_-S1U§ >= simulateTimeStep)
         {
            try
            {
               this.world.Step(simulateTimeStep * this.§_-w2g§,§_-74§,§_-p1D§);
               this.squirrels.update(simulateTimeStep);
               this.§_-S1U§ -= simulateTimeStep;
               this.world.ClearForces();
            }
            catch(e:Error)
            {
               §_-p2U§.add("SquirrelGame->update: " + e.message);
            }
         }
         this.map.update(timeStep);
         if(this.cast)
         {
            this.cast.update(timeStep);
         }
         this.camera.update();
         if(this.§_-T1y§)
         {
            this.§_-O1C§.update();
         }
      }
      
      public function onError() : void
      {
      }
      
      private function §_-W1N§(param1:Event = null) : void
      {
         if(this.§_-Qd§)
         {
            this.§_-Qd§.§_-128§ = new Rectangle(0,40,GameMap.§_-O19§,GameMap.§_-Gd§ - 40);
         }
         if(this.map)
         {
            this.shift = this.shift;
         }
      }
      
      private function onUpdate() : void
      {
         var _loc1_:Number = getTimer();
         var _loc2_:Number = (_loc1_ - this.§_-H1m§) * 0.001;
         this.§_-H1m§ = _loc1_;
         this.update(_loc2_);
      }
   }
}

